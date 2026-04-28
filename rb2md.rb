# frozen_string_literal: true

require 'ys1'
require_relative 'app'

def build_prompt(ruby_script)
  <<~EOLPROMPT
   explain the Ruby script briefly, in 25 words. start with: This script...
    ---
    #{ruby_script}
  EOLPROMPT
end

rb_files = YS1::Path.file_list('input/*/*.rb')

rb_files.each do |rb_file|
  puts rb_file
  md_file = "#{rb_file}.md"
  next if File.exist?(md_file)

  ruby_script = File.read(rb_file)
  ruby_script = irb_execute(ruby_script)
  puts ruby_script

  prompt = build_prompt(ruby_script)
  result = YS1::Ollama.stream(prompt)
  File.write(md_file, result)
  puts
end

#!/usr/bin/env ruby

require 'fileutils'
require 'ys1'
FileUtils.rm_rf('_posts') if Dir.exist?('_posts')
FileUtils.mkdir_p('_posts')

def posts_content(ruby_script, path)
  a,b,c = path.split('/')
  <<~RUBYPAGE
  ---
  layout: post
  category: #{b.downcase.gsub(/\s/,"")}
  ---

  ```ruby
  #{ruby_script}
  ```

  `Ruby #{RUBY_VERSION}`

  RUBYPAGE
end

def output_file_name(ruby_script)
  a,b,c = ruby_script.split('/')
  "_posts/2020-01-01-#{c}.markdown"
end

Dir.glob("input/*/*.rb").each do |path|
  puts path
  script = File.read(path)
  irb_result = YS1::Irb.execute(script)
  outcome = YS1::Irb.clean(irb_result)

  output_filename = output_file_name(path)
  File.write(output_filename, posts_content(outcome, path))
end

#!/usr/bin/env ruby

# frozen_string_literal: true

require 'irb'

def irb_execute(ruby_script)
  ruby_script = ruby_script.lines.map(&:strip).join("\n")

  command = <<~IRBCOMMAND
    irb --prompt simple --inspect pp <<'INNNERIRBCOMMAND'
    #{ruby_script}
    INNNERIRBCOMMAND
  IRBCOMMAND

  IO.popen(command, 'r', err: %i[child out], &:read)
end

def irb_clean(str)
  str.sub!(/\ASwitch to inspect mode./, '')

  str.lines.map do |line|
    line.sub(/\A(⢀|⣎|⣟).*\n/, '')
        .sub(/\A>>\s/, '')
        .sub(/\A\?> /, '')
        .sub(/\A"> /, '')
        .sub(/\A'> /, '')
        .sub(/\A\s@/, '# @')
        .sub(/\A=> \n?/, '#=> ')
        .sub(/\A\.\.\./, '#...')
        .sub(/\s{2}(end|\})\b*/, '\1')
  end.join.sub!(/\A\n\n\n/, '').sub(/\n\n$/, '')
end

require 'fileutils'
require 'ys1'
FileUtils.rm_rf('_posts') if Dir.exist?('_posts')
FileUtils.mkdir_p('_posts')

def posts_content(ruby_script, path, markdown)
  _, b, = path.split('/')
  <<~RUBYPAGE
    ---
    layout: post
    category: #{b.downcase.gsub(/\s/, '')}
    ---

    <small>This content was produced by an LLM and could include errors.</small>

    #{markdown}

    ```ruby
    #{ruby_script}
    ```

    `Ruby #{RUBY_VERSION}`

  RUBYPAGE
end

def output_file_name(ruby_script)
  _, _, c = ruby_script.split('/')
  "_posts/2020-01-01-#{c}.markdown"
end

if __FILE__ == $PROGRAM_NAME

  Dir.glob('input/*/*.rb').each do |path|
    puts path
    script = File.read(path)
    irb_result = irb_execute(script)
    outcome = irb_clean(irb_result)

    output_filename = output_file_name(path)
    markdown = File.read("#{path}.md")
    File.write(output_filename, posts_content(outcome, path, markdown))
  end

end

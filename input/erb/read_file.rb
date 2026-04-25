require 'erb'

erb = ERB.new(File.read('input/erb/file.html.erb'))
@val = 'val'

erb.result(binding)

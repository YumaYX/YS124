require 'erb'

ERB.new(File.read('input/erb/file.html.erb')).result(binding)

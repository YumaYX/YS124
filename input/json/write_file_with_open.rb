require 'json'

hash = {:key => 'value'}

File.open('input/json/file.json', 'w') {|f| JSON.dump(hash, f)}

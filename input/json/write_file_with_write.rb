require 'json'

hash = {:key => 'value'}

File.write('input/json/file.json', JSON.dump(hash))

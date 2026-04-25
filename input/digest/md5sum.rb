require 'digest/md5'

Digest::MD5.hexdigest("ruby")

Digest::MD5.file('input/digest/md5sum.rb').to_s


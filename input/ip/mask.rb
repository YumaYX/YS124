require 'ipaddr'

ip = IPAddr.new('255.255.255.255/32')
33.times { |i| puts "#{i}\t#{ip.mask(i)}" }


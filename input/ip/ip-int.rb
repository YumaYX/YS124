ip_str = "192.168.1.10"

# 文字列 → Integer
ip_int = ip_str.split('.').map(&:to_i).pack('C*').unpack1('N')

first  = (ip_int >> 24) & 0xFF
second = (ip_int >> 16) & 0xFF
third  = (ip_int >> 8)  & 0xFF
fourth = ip_int & 0xFF

ip_back = [ip_int].pack('N').unpack('C4').join('.')


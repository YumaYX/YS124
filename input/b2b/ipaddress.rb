# frozen_string_literal: true

def mask_to_cidr(mask)
  # count num of 1.
  mask.split('.').sum { it.to_i.to_s(2).count('1') }
end

p mask_to_cidr('255.255.255.0')

def cidr_to_mask(cidr)
  # Repeat '1' cidr times and then pad with '0's to make 32 bits.
  bits = '1' * cidr + '0' * (32 - cidr)
  # split into chunks of 8 characters.
  bits.scan(/.{8}/).map { it.to_i(2) }.join('.')
end

p cidr_to_mask(24)

def ip_address?(ip)
  parts = ip.split('.')
  return false unless parts.size == 4

  parts.all? do |p|
    return false unless p =~ /^\d+$/

    num = p.to_i
    return false if num.negative? || num > 255
    return false if p != num.to_s # 先頭ゼロ防止

    true
  end
end

p ip_address?('127.0.0.1')

def subnet_mask?(mask)
  parts = mask.split('.')
  return false unless parts.size == 4

  binary = ''
  parts.each do |p|
    return false unless p =~ /^\d+$/

    num = p.to_i
    return false if num.negative? || num > 255

    binary += num.to_s(2).rjust(8, '0')
  end
  # 1の後に0が続く形式のみ許可
  return false if binary.include?('01')
  # 全0 or 全1は除外
  return false if binary == '0' * 32 || binary == '1' * 32

  true
end

p subnet_mask?('255.0.0.0')

def network_address?(ip, mask)
  return false unless ip_address?(ip)
  return false unless subnet_mask?(mask)

  ip_parts   = ip.split('.').map(&:to_i)
  mask_parts = mask.split('.').map(&:to_i)

  4.times do |i|
    # ホスト部が0かチェック
    return false if (ip_parts[i] & (~mask_parts[i] & 0xFF)) != 0
  end

  true
end
p network_address?('10.0.0.0', cidr_to_mask(16))

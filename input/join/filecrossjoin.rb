def read_lines(path)
  File.readlines(path, chomp: true)
end

arrays = ARGV.map { |path| read_lines(path) }

#abort "Please specify at least one file." if arrays.empty?

first, *rest = arrays
first, *rest = ("a".."b").to_a, 2.times.to_a, ("x".."y").to_a # for presentation only (remove later)


first.product(*rest) do |*row|
  puts row.join(",")
end

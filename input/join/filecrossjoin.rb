def read_lines(path)
  File.readlines(path, chomp: true)
end

arrays = ARGV.map { |path| read_lines(path) }

abort "Please specify at least one file." if arrays.empty?

first, *rest = arrays

first.product(*rest) do |*row|
  puts row.join(",")
end

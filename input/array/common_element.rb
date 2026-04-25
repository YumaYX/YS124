a = ["z3qx", "l9ma", "b77r", "x1p0"]
b = ["x1p0", "l9ma", "wxyz"]

(a & b).sort.first
a.find { |x| b.include?(x) }

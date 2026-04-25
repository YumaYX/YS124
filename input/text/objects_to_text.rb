data = [
  {:id => "a", :val1 => [1, 2, 3], :val2 => [3, 4]},
  {:id => "b", :val1 => [0], :val2 => [9, 8, 7]}
]

puts data.first.keys.join("\t")

data.each do |entry|
  id = entry[:id]
  val1 = entry[:val1]
  val2 = entry[:val2]
  
  max_length = [val1.length, val2.length].max
  max_length.times do |i|
    id_output = (i == 0 ? id : "")
    
    val1_output = (val1[i].nil? ? "" : val1[i])
    val2_output = (val2[i].nil? ? "" : val2[i])
    
    puts [id_output, val1_output, val2_output].join("\t")
  end
end

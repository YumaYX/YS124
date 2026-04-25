require "csv"
data = CSV.read("input/text/group.csv", encoding: "BOM|UTF-8", headers: true).map(&:to_h)

class Family
  attr_accessor :children

  def initialize(parent)
    @parent = parent
    @children = []
  end
end

arr = []
data.each do |hash|
  parent = hash["parent"]
  if parent.nil?
    arr.last.children << hash["child"]
  else
    arr << Family.new(parent)
    arr.last.children << hash["child"]
  end
end

arr

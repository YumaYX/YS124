require 'roo'

two_dimensional = []
xlsx = Roo::Excelx.new('input/roo/book.xlsx')
sh1 = xlsx.sheet('mysheet')
sh1.each do |row|
  two_dimensional << row
end
two_dimensional

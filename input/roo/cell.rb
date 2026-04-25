require 'roo'

xlsx = Roo::Excelx.new('input/roo/book.xlsx')
sh1 = xlsx.sheet('mysheet')
sh1.cell(1,1)
sh1.cell(1,2)
sh1.last_row
sh1.last_column

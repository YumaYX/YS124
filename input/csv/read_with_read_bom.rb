require 'csv'
CSV.read('input/csv/file.csv', encoding: "BOM|UTF-8", headers: true).map(&:to_h)

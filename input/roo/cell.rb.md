このスクリプトは roo によるExcelセル読み取りです。`Roo::Excelx.new` で book.xlsx を開き、`sheet('mysheet')` で対象シートを選択します。`cell(行, 列)` は1始まり(A1 = cell(1,1))で個々のセルを参照でき、`last_row` / `last_column` でデータの末端位置も取得できます。

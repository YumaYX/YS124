このスクリプトはもう1つのJSON書き込み方法です。`JSON.dump(hash)` の戻り値(JSON文字列)を `File.write` で一括保存し、`{"key":"value"}` が file.json へ書き出されます。小さなデータなら open 版より簡潔です。

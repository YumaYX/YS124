このスクリプトは `File.readlines(...)` でファイルを `["line1\n", "line2\n", "line3\n"]` という行配列に読み込んだ後、`map(&:chomp)` で末尾の改行を除去して `["line1", "line2", "line3"]` を作ります。なお `readlines(chomp: true)` を使えば1段階で同じ結果が得られます。

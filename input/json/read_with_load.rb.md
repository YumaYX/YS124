このスクリプトはJSON読み込み方法の1つです。`File.read` で全文を文字列化してから `JSON.load` に渡し、`{"key" => "value"}` というハッシュへ変換します。load はIOオブジェクトも直接受け付けます(read_with_open.rb 参照)。

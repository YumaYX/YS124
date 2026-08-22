このスクリプトはMarshalによる永続化(シリアライズ)です。ハッシュ `{name: "Alice", age: 30}` を `Marshal.dump` でRuby固有のバイナリ形式へ変換し、バイナリモード `'wb'` で開いた person.dat へ書き込みます。deserialization.rb と対になるスクリプトです。

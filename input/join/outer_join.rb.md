このスクリプトは配列同士の左外部結合です。users 各要素について `user_id` が一致する投稿を `find` で探し、見つかれば `merge` で title を統合します。投稿がないユーザー(Charlie)は `title: nil` のまま保持され、SQLの LEFT JOIN と同じ結果が得られます。

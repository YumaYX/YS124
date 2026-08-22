このスクリプトはWeb APIアクセスの最小例です。URI と `Net::HTTP.get` でopenBD API(ISBN 9784791765553 を指定)へGETリクエストを送り、応答ボディのJSONを `JSON.parse` で配列・ハッシュへ変換して書誌情報を利用できるようにします。APIが利用可能なときのみ成功します。

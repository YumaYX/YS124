require "net/http"
require "json"

url = "https://api.openbd.jp/v1/get?isbn=9784791765553"
uri = URI(url)
response = Net::HTTP.get(uri)
JSON.parse(response)

require "net/http"

def rc2xx?(uri)
    url = URI.parse(uri)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = (url.scheme == "https")
    request = Net::HTTP::Get.new(url.path)
    
    response = http.request(request)
    response_code = response.code.to_i
    response_code >= 200 && response_code < 300
end

rc2xx?("https://yumayx.github.io/")

module StaticPagesHelper
  require 'net/http'
  require 'uri'

  def hpStatus
    uri = URI.parse('https://www.google.com')
    response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
    http.get('/')
    end
    status_code = response.code
    return status_code
  end
end

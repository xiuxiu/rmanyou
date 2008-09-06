require 'net/http'
require 'pp'

module Rmanyou
  class Service
    DEBUG = false
    def post(params)

      pp "params: #{params.inspect}" if DEBUG

        res = Net::HTTP.post_form(url, params)

      pp "res: #{res.inspect}" if DEBUG
      pp "res.body: #{res.body}" if DEBUG

      res
    end
    
    private
    def url
      URI.parse('http://api.manyou.com/openapi.php')
    end
  end
end

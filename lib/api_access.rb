# frozen_string_literal: true

class ApiAccess
  URL = ENV['API_URL'] || 'https://the-one-api.dev/v2/'

  cattr_accessor :authenticate, default: true

  class << self
    def get_response(resource, params = {})
      uri =  URI.parse("#{URL}#{resource}")

      request = Net::HTTP::Get.new(uri)

      request['Authorization'] = "Bearer #{get_token}" if authenticate
      get_result(uri, request)
    end

    private

    def get_token
      ENV['API_TOKEN']
    end

    def get_result(uri, request)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request['User-Agent'] = 'one-api-ruby'
      response = http.request(request)
      [response.code, JSON.parse(response.body)]
    end
  end
end
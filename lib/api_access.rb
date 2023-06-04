# frozen_string_literal: true

class ApiAccess
  URL = ENV['API_URL'] || 'https://the-one-api.dev/v2/'

  cattr_accessor :authenticate, default: true
  cattr_accessor :model_name
  
  class << self
    def all(params={})
      set_model_name
      result = {}
      code, body = get_response(model_name, params)
      result = body if code.to_i == 200
      [code, result]
    end

    def find_by_id(id)
      set_model_name
      result = {}
      resource = model_name + "/#{id.to_s}"
      code, body = get_response(resource)
      result = body if code.to_i == 200
      [code, result]
    end

    protected

    def get_response(resource, params = {})
      uri = set_url(resource, params)
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

    def set_url(resource, params)
      url = "#{URL}#{resource}"
      url = url + set_filter_params(params) if check_filter_params(params)
      URI.parse(url)
    end

    def set_filter_params(params)
      url = []
      url << params[:query] if params[:query] 
      url << 'sort=' + params[:sort] if params[:sort]
      url << 'page=' + params[:page] if params[:page]
      url << 'limit=' +params[:limit] if params[:limit]
      url << 'offset=' + params[:offset] if params[:offset]
      '?' + url.join('&')
    end 

    def check_filter_params(params)
      (params[:query] || params[:sort] || params[:limit] || params[:page] || params[:offset]).present?
    end
  end
end
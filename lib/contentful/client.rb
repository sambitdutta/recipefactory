require 'net/http'
require 'uri'
require 'json'
require_relative 'config'

module Contentful
  class Client
    attr_reader :config

    def initialize(config = Config.new)
      @config = config
    end

    def call(opts = {})
      url = [config.base_url, 'spaces', config.space, 'environments', config.environment, 'entries'].join('/')
      uri = URI.parse(url)
      params = opts
      uri.query = URI.encode_www_form(params)
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.request_uri)
      request["Authorization"] = "Bearer #{config.access_token}"
      response = http.request(request)
      response = JSON.parse(response.body)
    end
  end
end

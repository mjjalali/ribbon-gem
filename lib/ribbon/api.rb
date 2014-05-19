require 'rest_client'

module Ribbon
  class Api
    class << self
      def base_uri
        "http://demo.kalahoo.co/api/v1"
      end

      def with_authenticated_uri(uri)
        "#{base_uri}/#{uri}?apiKey=#{Ribbon.configuration.api_key}"
      end

      def post(uri, options = {})
        RestClient.post(with_authenticated_uri(uri), options)
      end

      def get(uri, options = {})
        RestClient.get(with_authenticated_uri(uri), options)
      end
    end
  end
end

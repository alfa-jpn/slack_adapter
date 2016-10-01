module SlackAdapter
  module Requester
    class << self
      # Request to slack.
      # @raise [RequestException, UninitializedTokenException] when return error.
      # @param [String] method Slack API method.
      # @param [Hash]   params Parameters
      # @return [Hash] result
      def request!(method, params)
        raise UninitializedTokenException, 'SlackAdapter.configs.token was not set.' unless SlackAdapter.config.token.present?

        begin
          JSON.parse(Net::HTTP.get(create_uri(method, params))).tap do |result|
            raise result['error'] unless result['ok']
          end
        rescue => e
          raise RequestException, e.message
        end
      end

      private
      # Create request uri.
      # @param [String] method Slack API method.
      # @param [Hash]   params Parameters
      # @return [URI] URI
      def create_uri(method, params)
        URI.parse([SlackAdapter.config.api_url, method].join('/')).tap do |uri|
          uri.query = URI.encode_www_form(params.merge(token: SlackAdapter.config.token))
        end
      end
    end

    class UninitializedTokenException < StandardError; end
    class RequestException < StandardError; end
  end
end

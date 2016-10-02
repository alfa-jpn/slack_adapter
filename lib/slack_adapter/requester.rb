module SlackAdapter
  # Slack requester.
  module Requester
    class << self
      # Request to slack.
      # @raise [RequestException] when return error.
      # @param [String] method Slack API method.
      # @param [Hash]   params Parameters
      # @return [Hash] result
      def request!(method, params)
        JSON.parse(Net::HTTP.get(create_uri!(method, params))).tap do |result|
          raise result['error'] unless result['ok']
        end
      rescue => e
        raise RequestException, e.message
      end

      private
      # Create request uri.
      # @raise [StandardException] when token hasn't been initialized.
      # @param [String] method Slack API method.
      # @param [Hash]   params Parameters
      # @return [URI] URI
      def create_uri!(method, params)
        if SlackAdapter.config.token.nil? or SlackAdapter.config.token.empty?
          raise 'SlackAdapter.configs.token was not set.'
        end

        URI.parse([SlackAdapter.config.api_url, method].join('/')).tap do |uri|
          uri.query = URI.encode_www_form(params.merge(token: SlackAdapter.config.token))
        end
      end
    end

    class RequestException < StandardError; end
  end
end

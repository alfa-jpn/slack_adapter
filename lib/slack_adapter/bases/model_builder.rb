require 'slack_adapter/bases/converters/boolean_converter'
require 'slack_adapter/bases/converters/hash_converter'

module SlackAdapter::Bases
  # Model builder.
  class ModelBuilder

    # Initialize builder.
    # @param [Class]   klass      class.
    # @param [String]  key        key of data.(optional)
    # @param [Boolean] collection true if data is collection.
    # @yield data parser
    # @yieldparam [Hash] response Response.
    # @yieldreturn [Hash] Model initialize parameter.
    def initialize(klass, key, collection, &parser)
      @klass      = klass
      @key        = key.to_s
      @collection = collection
      @parser     = parser
    end

    # Build model.
    # @param [Hash] parameters
    def build(parameters)
      parameters = (@key ? parameters[@key] : parameters)
      klass.new(@parser ? @parser.call(parameters) : parameters)
    end
  end
end

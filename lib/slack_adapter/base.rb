require 'slack_adapter/bases/boolean'
require 'slack_adapter/bases/converter'

module SlackAdapter
  # Adapter base.
  class Base
    # Initialize instance.
    # @param [Hash] parameters Parameters.
    def initialize(parameters = {})
      parameters.each do |key, value|
        if respond_to?("#{key}=")
          send("#{key}=", value)
        end
      end
    end

    # Define column.
    # @param [Symbol] name name of column.
    # @param [Class]  type class of column.
    def column(name, type)
      define_method "#{name}=" do |value|
        instance_variable_set name, Bases::Converter.convert!(value, type)
      end
      attr_reader name
    end

    # Define method.
    # @param [Symbol] name       name of method.
    # @param [String] api_method method of slack api.
    # @yield data parser
    # @yieldparam [Hash] response Response.
    # @yieldreturn [Hash] Model inititialize parameter.
    def method(name, api_method, model: nil, &block)
      define_method name do |params|
        klass = (model || self)
      end
    end
  end
end

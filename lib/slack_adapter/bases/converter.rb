require 'slack_adapter/bases/converters/boolean_converter'
require 'slack_adapter/bases/converters/hash_converter'

module SlackAdapter::Bases
  # Value converter.
  module Converter
    class << self
      # Convert value.
      # @raise [StandardError] when unknown type.
      # @param [Object] value Value
      # @param [Class]  type  Type
      def convert!(value, type)
        if converter = conversion_rules[type]
          converter.convert(value)
        else
          raise "unknown converter for #{type}"
        end
      end

      private
      # Conversion rules.
      # @return [Hash<Class, Module>] Rules.
      def conversion_rules
        @conversion_rules ||= Hash.new.tap do |rules|
          Converters.constants.map { |c| Converters.const_get(c) }.each do |object|
            if object.respond_to?(:target) and object.respond_to?(:convert)
              rules[object.target] = object
            end
          end
        end
      end
    end
  end
end

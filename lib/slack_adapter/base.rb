require 'slack_adapter/bases/boolean'
require 'slack_adapter/bases/converter'

module SlackAdapter
  # Adapter base.
  class Base
    # define column.
    # @param [Symbol] name
    # @param [Class]  type
    def column(name, type)
      define_method "#{name}=" do |value|
        instance_variable_set name, Bases::Converter.convert!(value, type)
      end
      attr_reader name
    end
  end
end

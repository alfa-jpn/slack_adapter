module SlackAdapter::Bases::Converters
  # Boolean converter.
  module BooleanConverter
    # Conversion target.
    # @return [Class] target.
    def self.target
      SlackAdapter::Bases::Boolean
    end

    # Convert.
    # @return [TrueClass,FalseClass] converted value.
    def self.convert(value)
      case value
        when TrueClass, FalseClass
          value
        else
          str_value = value.to_s
          str_value == 'true' or str_value == '1'
      end
    end
  end
end

module SlackAdapter::Bases::Converters
  # Hash converter.
  module HashConverter
    # Conversion target.
    # @return [Class] target.
    def self.target
      Hash
    end

    # Convert.
    # @return [Hash, nil] converted value.
    def self.convert(value)
      case value
        when Hash
          value
        else
          if value.respond_to?(:to_h)
            value.to_h
          else
            nil
          end
      end
    end
  end
end

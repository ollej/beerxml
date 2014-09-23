module NRB; module BeerXML;
  module RecordValidators
    class PercentageValidator < ActiveModel::EachValidator

      def validate_each(record, attribute, value)
        return unless value
        unless value.is_a?(Numeric) && greater_than_min(value) && less_than_max(value)
          record.errors[attribute] << 'must be a BeerXML percentage (a number between 0 & 100)'
        end
      end

    private

      def greater_than_min(value)
        options[:allow_negative] ? true : value >= min
      end


      def less_than_max(value)
        options[:allow_over_100] ? true : value <= max
      end


      def max
        options[:max] || 100
      end


      def min
        options[:min] || 0
      end

    end
  end
end; end
defined?(PercentageValidator) || PercentageValidator = NRB::BeerXML::RecordValidators::PercentageValidator


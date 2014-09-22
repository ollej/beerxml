module NRB; module BeerXML;
  module RecordValidators
    class PercentageValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        return unless value
        unless value.is_a?(Numeric) && value >= 0 && value <= 100
          record.errors[attribute] << 'must be a BeerXML percentage (a number between 0 & 100)'
        end
      end
    end
  end
end; end

defined?(PercentageValidator) || PercentageValidator = NRB::BeerXML::RecordValidators::PercentageValidator # Hack

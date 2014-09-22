module NRB; module BeerXML;
  module RecordValidators
    class BooleanValidator < ActiveModel::Validations::InclusionValidator
      def validate_each(record, attribute, value)
        unless include?(record, value)
          record.errors[attribute] << "must be false or true"
        end
      end
    private
      def delimiter; [false, true]; end
    end
  end
end; end

defined?(BooleanValidator) || BooleanValidator = NRB::BeerXML::RecordValidators::BooleanValidator # Hack

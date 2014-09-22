module NRB
  module BeerXML
    class RecordSet

      class UnknownIdentifierError < RuntimeError; end

     attr_reader :identifier, :records

      def <<(record)
        @records << record
      end


      def initialize(identifier: nil)
        @identifier = identifier
        @records = []
      end

    end
  end
end

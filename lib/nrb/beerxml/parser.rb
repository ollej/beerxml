module NRB
  module BeerXML
    class Parser
      attr_reader :reader

      def initialize(reader: Nokogiri::XML, results_object: nil)
        @reader = reader
        @results_object = results_object
      end


      def parse
      end

    end
  end
end

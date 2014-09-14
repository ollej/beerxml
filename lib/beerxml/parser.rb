require 'nokogiri'
module NRB
  module BeerXML
    class Parser
      attr_reader :reader

      def initialize(reader: Nokogiri::XML, results_object: nil, schema: BeerXML.schema)
        @reader = reader
        @results_object = results_object
        @schema = schema
      end


      def parse(entry)
        case entry
        when String
          parse_file(file: entry)
        else
          raise ArgumentError "Don't know how to parse a #{entry.class}"
        end
      end


      def parse_file(file: nil)
        doc = parse_xml(file)
      end

    private

      def parse_xml(file)
        f = File.open(file)
        doc = reader.parse(f)
        f.close
        doc
      end

    end
  end
end

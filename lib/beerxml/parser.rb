require 'nokogiri'

module NRB
  module BeerXML
    class Parser
      attr_reader :reader

      def initialize(reader: Nokogiri::XML)
        @reader = reader
      end


      def parse(entry)
        case entry
        when IO
          parse_xml entry
        when String
          parse_path(file: entry)
        else
          raise ArgumentError "Don't know how to parse a #{entry.class}"
        end
        self
      end


      def parse_path(file: nil)
        f = File.open(file)
        doc = parse_xml(file)
        f.close
        doc
      end

    private

      def parse_xml(stream)
        reader.parse(stream)
      end

    end
  end
end

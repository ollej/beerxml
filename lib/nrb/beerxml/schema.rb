require 'yaml'
module NRB
  module BeerXML
    class Schema

      class ParseError < RuntimeError; end

      def dump
        @schema
      end


      def initialize(stream_loader: YAML, schema_dir: nil)
        @schema_dir = schema_dir
        load_schema(stream_loader: stream_loader)
      end

    private

      def incorporate(schema)
        raise ParseError.new("Schema has no type #{schema}") unless schema[:type]
        if respond_to? "incorporate_#{schema[:type]}", true
          send "incorporate_#{schema[:type]}", schema
        else
          raise ParseError.new "Do not know how to incorporate #{schema[:type]}"
        end
      end


      def incorporate_record(schema)
        @schema[:records] ||= {}
        @schema[:records].merge!(schema[:records])
      end


      def incorporate_record_set(schema)
        @schema[:record_sets] ||= {}
        @schema[:record_sets].merge!(schema[:record_sets])
      end


      def load_schema(stream_loader: YAML)
        @schema = { }
        @schema_dir.each do |file|
          next unless file =~ /\.yml$/
          schema = stream_loader.load_stream( File.open( File.join(@schema_dir.path,file) ) )[0]
          incorporate schema
        end
        sanity_check
        @schema
      end


      def sanity_check
puts "I'm not insane!"
      end

    end
  end
end

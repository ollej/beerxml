module NRB
  module BeerXML

    autoload :Hop,         'beerxml/hop'
    autoload :Fermentable, 'beerxml/fermentable'
    autoload :Parser,      'beerxml/parser'
    autoload :Record,      'beerxml/record'
    autoload :RecordSet,   'beerxml/record_set'
    autoload :RecordValidators, 'beerxml/record_validators'
    autoload :Schema,      'beerxml/schema'

    class << self

      def load_schema(directory: nil)
        Schema.new schema_dir: directory
      end


      def schema(directory: schema_dir)
        @schema ||= load_schema directory: directory
      end

    private

      def schema_dir
        Dir.new( File.expand_path( File.join( File.dirname(__FILE__), '..', 'schema' ) ) )
      end


      def schema_file_path(key)
        return key if File.absolute_path(key) == key
        File.expand_path( File.join( schema_dir, key ) )
      end

    end

  end
end

module NRB; module BeerXML
  class RecordSet

    include Enumerable

    class UnknownRecordTypeError < RuntimeError; end

    attr_reader :record_type, :records

    def self.valid_record_types
      %i( equipment fermentable hop mash mash_step misc recipe style water yeast )
    end


    def <<(record)
      raise UnknownRecordTypeError.new("Can't add a #{record.record_type} to this set (only #{record_type}s)") unless valid_record_type?(record.record_type)
      @records << record
    end


    def each(&block)
      @records.each &block
    end


    def initialize(record_type: nil)
      raise UnknownRecordTypeError.new("Don't know what to do with a #{record_type} record") unless valid_record_type?(record_type)
      @record_type = record_type
      @records = []
    end

  private

    def valid_record_type?(type)
      self.class.valid_record_types.include?(type)
    end

  end
end; end

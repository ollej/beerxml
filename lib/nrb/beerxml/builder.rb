module NRB; module BeerXML
  class Builder

    include Inflector

    RECORDS = %w( Equipment Fermentable Hop Mash MashStep Misc Recipe Style Water Yeast )

    def self.records; RECORDS; end
    def self.record_sets; records.map() { |type| "#{type}s" }; end


    def build(type)
      if record_set? type
        RecordSet.new record_type: underscore(type.sub(/s$/,'')).to_sym
      else
        ::Module.nesting[1].const_get(type).new
      end
    rescue NameError
      nil
    end

  private

    def record_set?(type)
      self.class.record_sets.include? type
    end

  end
end; end

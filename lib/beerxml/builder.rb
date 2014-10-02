module NRB; module BeerXML
  class Builder

    SETS = %w( Equipments Fermentables Hops Mashs MashSteps Miscs Recipes Styles Waters Yeasts )

    def self.sets; SETS; end


    def build(type)
      if self.class.sets.include? type
        RecordSet.new record_type: underscore(type.sub(/s$/,'')).to_sym
      else
        ::Module.nesting[1].const_get(type).new
      end
    rescue NameError
      nil
    end

  private

    def underscore(camel_cased_word)
      word = camel_cased_word.to_s.gsub('::', '/')
      word.gsub!(/([A-Z\d]+)([A-Z][a-z])/,'\1_\2')
      word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
      word.tr!("-", "_")
      word.downcase!
      word
    end

  end
end; end

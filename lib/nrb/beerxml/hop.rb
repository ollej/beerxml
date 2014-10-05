require 'nrb/beerxml/record_validators/percentage_validator'  # hack so "validates percentage:" magic works
module NRB; module BeerXML
  class Hop < Record

    attr_accessor :alpha          # percentage required
    attr_accessor :amount         # weight     required
    attr_accessor :beta           # percentage
    attr_accessor :caryophyllene  # percentage
    attr_accessor :cohumulone     # percentage
    attr_accessor :form           # list
    attr_accessor :hsi            # percentage
    attr_accessor :myrcene        # percentage
    attr_accessor :notes          # text
    attr_accessor :origin         # text
    attr_accessor :substitutes    # text
    attr_accessor :time           # time       required
    attr_accessor :type           # list
    attr_accessor :use            # list       required

    validates :alpha, presence: true, percentage: true
    validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :beta, percentage: true
    validates :caryophyllene, percentage: true
    validates :cohumulone, percentage: true
    validates :form, inclusion: { in: %w(Leaf Pellet Plug) }
    validates :hsi, percentage: true
    validates :myrcene, percentage: true
    validates :time, presence: true,
                     numericality: { greater_than_or_equal_to: 0 }
    validates :type, inclusion: { in: %w(Aroma Bittering Both) }

    validates :use, presence: true,
                    inclusion: { in: [ "Aroma", "Boil", "Dry Hop", "First Wort", "Mash" ] }

  end
end; end

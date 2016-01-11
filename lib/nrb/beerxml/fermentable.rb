require 'nrb/beerxml/record_validators/boolean_validator'  # hack so "validates percentage:" magic works
require 'nrb/beerxml/record_validators/percentage_validator'  # hack so "validates percentage:" magic works

module NRB; module BeerXML
  class Fermentable < Record

    attr_accessor :add_after_boil   # boolean
    attr_accessor :amount           # weight required
    attr_accessor :coarse_fine_diff # percent
    attr_accessor :color            # float required
    attr_accessor :diastatic_power  # float
    attr_accessor :ibu_gal_per_lb   # float
    attr_accessor :max_in_batch     # percent
    attr_accessor :moisture         # percent
    attr_accessor :notes            # text
    attr_accessor :origin           # text
    attr_accessor :recommend_mash   # boolean
    attr_accessor :supplier         # text
    attr_accessor :type             # list required
    attr_accessor :yield            # percent required
    attr_accessor :protein          # percent
    attr_accessor :potential        # float

    validates :add_after_boil, boolean: { allow_nil: true }
    validates :amount, presence: true
    validates :color, presence: true
    validates :type, inclusion: { in: [ "Adjunct", "Dry Extract", "Extract", "Grain", "Sugar" ] }, presence: true
    validates :yield, presence: true

    validates :protein, numericality: { allow_nil: true, greater_than_or_equal_to: 0 }
    validates :potential, numericality: { allow_nil: true, greater_than_or_equal_to: 1 }
    validates :diastatic_power, numericality: { allow_nil: true, greater_than_or_equal_to: 0 }

  end
end; end

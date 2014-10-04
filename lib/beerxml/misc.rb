require 'beerxml/record_validators/boolean_validator'  # hack so "validates boolean:" magic works
module NRB; module BeerXML
  class Misc < Record

    attr_accessor :amount           # float required
    attr_accessor :amount_is_weight # boolean
    attr_accessor :notes            # string
    attr_accessor :time             # time required
    attr_accessor :type             # list required
    attr_accessor :use              # list required
    attr_accessor :use_for          # string

    validates :amount, numericality: { greater_than_or_equal_to: 0 }, presence: true
    validates :amount_is_weight, boolean: true
    validates :time, numericality: { greater_than_or_equal_to: 0 },
                     presence: true
    validates :type, inclusion: { in: ["Fining", "Flavor", "Herb", "Other", "Spice", "Water Agent"] }, presence: true
    validates :use, inclusion: { in: %w(Boil Bottling Mash Primary Secondary) }, presence: true


  end
end; end

require 'nrb/beerxml/record_validators/boolean_validator'
module NRB; module BeerXML
  class Mash < Record

    attr_accessor :equip_adjust      # boolean
    attr_accessor :grain_temp        # temperature required
    attr_accessor :mash_steps        # record set required
    attr_accessor :notes             # string
    attr_accessor :ph                # float
    attr_accessor :sparge_temp       # temperature
    attr_accessor :tun_specific_heat # float
    attr_accessor :tun_temp          # temperature
    attr_accessor :tun_weight        # weight

    validates :grain_temp, numericality: true, presence: true
    validates :mash_steps, presence: true
    validates :ph, numericality: { allow_nil: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 14 }
    validates :sparge_temp, numericality: { allow_nil: true }
    validates :tun_specific_heat, numericality: { allow_nil: true, greater_than_or_equal_to: 0 }
    validates :tun_temp, numericality: { allow_nil: true }
    validates :tun_weight, numericality: { allow_nil: true, greater_than_or_equal_to: 0 }


    after_initialize :initialize_mash_steps

  private

    def initialize_mash_steps
      self.mash_steps ||= RecordSet.new(record_type: :mash_step)
    end

  end
end; end

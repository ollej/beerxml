require 'beerxml/record_validators/boolean_validator'
require 'beerxml/record_validators/percentage_validator'
module NRB
  module BeerXML
    class Equipment < Record

      attr_accessor :batch_size           # volume required
      attr_accessor :boil_size            # volume required
      attr_accessor :boil_time            # time
      attr_accessor :calc_boil_volume     # boolean
      attr_accessor :evap_rate            # percent
      attr_accessor :hop_utilization      # percent
      attr_accessor :lauter_tun_deadspace # volume
      attr_accessor :notes                # string
      attr_accessor :top_up_kettle        # volume
      attr_accessor :top_up_water         # volume
      attr_accessor :trub_chiller_loss    # volume
      attr_accessor :tun_specific_heat    # float
      attr_accessor :tun_volume           # volume
      attr_accessor :tun_weight           # weight

      validates :batch_size, numericality: { greater_than_or_equal_to: 0 }, presence: true
      validates :boil_size, numericality: { greater_than_or_equal_to: 0 }, presence: true
      validates :boil_time, numericality: { greater_than_or_equal_to: 0 }
      validates :calc_boil_volume, boolean: true
      validates :evap_rate, percentage: true
      validates :hop_utilization, percentage: { give_110: true }
      validates :lauter_tun_deadspace, numericality: { greater_than_or_equal_to: 0 }
      validates :top_up_kettle, numericality: { greater_than_or_equal_to: 0 }
      validates :top_up_water, numericality: { greater_than_or_equal_to: 0 }
      validates :trub_chiller_loss, numericality: { greater_than_or_equal_to: 0 }
      validates :tun_specific_heat, numericality: { greater_than_or_equal_to: 0 }
      validates :tun_volume, numericality: { greater_than_or_equal_to: 0 }
      validates :tun_weight, numericality: { greater_than_or_equal_to: 0 }

    end
  end
end

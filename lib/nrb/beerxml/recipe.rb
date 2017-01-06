require 'nrb/beerxml/record_validators/boolean_validator'  # hack so "validates boolean:" magic works
require 'nrb/beerxml/record_validators/percentage_validator'  # hack so "validates percentag:" magic works
module NRB; module BeerXML
  class Recipe < Record

    after_initialize :set_up_record_sets

    attr_accessor :age                 # time
    attr_accessor :age_temp            # temperature
    attr_accessor :asst_brewer         # string
    attr_accessor :batch_size          # volume required
    attr_accessor :boil_size           # volume required
    attr_accessor :boil_time           # time required
    attr_accessor :brewer              # string required
    attr_accessor :carbonation         # float
    attr_accessor :carbonation_temp    # temperature
    attr_accessor :date                # string
    attr_accessor :efficiency          # percentage conditionally required
    attr_reader   :equipment           # equipment record
    attr_accessor :est_fg              # specific gravity
    attr_accessor :est_og              # specific gravity
    attr_accessor :fermentables        # fermentables record set required
    attr_accessor :fermentation_stages # integer
    attr_accessor :fg                  # specific gravity
    attr_accessor :forced_carbonation  # boolean
    attr_accessor :hops                # hops record set required
    attr_accessor :keg_priming_factor  # float
    attr_accessor :mash                # mash profile record required
    attr_accessor :miscs               # miscs record set required
    attr_accessor :notes               # string
    attr_accessor :og                  # specific gravity
    attr_accessor :primary_age         # time
    attr_accessor :primary_temp        # temperature
    attr_accessor :priming_sugar_equiv # float
    attr_accessor :priming_sugar_name  # string
    attr_accessor :secondary_age       # time
    attr_accessor :secondary_temp      # temperature
    attr_reader   :style               # style record required
    attr_accessor :taste_notes         # string
    attr_accessor :taste_rating        # float
    attr_accessor :tertiary_age        # time
    attr_accessor :tertiary_temp       # temperature
    attr_accessor :type                # list required
    attr_accessor :waters              # waters record set required
    attr_accessor :yeasts              # yeasts record set required

    validates :age, numericality: { allow_nil: true, greater_than_or_equal_to: 0 }
    validates :age_temp, numericality: { allow_nil: true }
    validates :batch_size, numericality: { allow_nil: true, greater_than_or_equal_to: 0 }, presence: true
    validates :boil_size, numericality: { allow_nil: true, greater_than_or_equal_to: 0 }, presence: true
    validates :boil_time, numericality: { allow_nil: true, greater_than_or_equal_to: 0 }, presence: true
    validates :brewer, presence: true
    validates :carbonation, numericality: { allow_nil: true, greater_than_or_equal_to: 0 }
    validates :carbonation_temp, numericality: { allow_nil: true }
    validates :equipment, presence: true
    validates :efficiency, percentage: { allow_nil: true }, presence: { if: Proc.new { |recipe| recipe.efficiency_required? } }
    validates :est_fg, numericality: { allow_nil: true }
    validates :est_og, numericality: { allow_nil: true }
    validates :fermentables, presence: true
    validates :fermentation_stages, numericality: { allow_nil: true, only_integer: true }
    validates :fg, numericality: { allow_nil: true }
    validates :forced_carbonation, boolean: { allow_nil: true }
    validates :hops, presence: true
    validates :keg_priming_factor, numericality: { allow_nil: true }
    validates :mash, presence: true
    validates :miscs, presence: true
    validates :og, numericality: { allow_nil: true }
    validates :primary_age, numericality: { allow_nil: true, greater_than_or_equal_to: 0 }
    validates :primary_temp, numericality: { allow_nil: true }
    validates :priming_sugar_equiv, numericality: { allow_nil: true }
    validates :secondary_age, numericality: { allow_nil: true, greater_than_or_equal_to: 0 }
    validates :secondary_temp, numericality: { allow_nil: true }
    validates :style, presence: true
    validates :taste_rating, numericality: { allow_nil: true }
    validates :tertiary_age, numericality: { allow_nil: true, greater_than_or_equal_to: 0 }
    validates :tertiary_temp, numericality: { allow_nil: true }
    validates :type, inclusion: { in: [ "All Grain", "Extract", "Partial Mash" ] }, presence: true
    validates :waters, presence: true
    validates :yeasts, presence: true


    def equipment=(equipment)
      restricted_assign :equipment, equipment
    end


    def efficiency_required?
      ["All Grain", "Partial Mash"].include?(type)
    end


    def set_up_record_sets
      %i(fermentable hop misc water yeast).each do |record_type|
        send "#{record_type}s=", RecordSet.new(record_type: record_type)
      end
    end


    def style=(style)
      restricted_assign :style, style
    end

  private

    def restricted_assign(type, value)
      raise "Can't assign a non-#{type} to #{type} (got a #{value.record_type}" unless value.nil? || value.send("#{type}?")
      instance_variable_set "@#{type}", value
    end

  end
end; end

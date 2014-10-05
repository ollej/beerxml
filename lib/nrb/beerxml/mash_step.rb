module NRB; module BeerXML
  class MashStep < Record

    attr_accessor :end_temp      # temperature
    attr_accessor :infuse_amount # volume conditionally required
    attr_accessor :ramp_time     # time
    attr_accessor :step_temp     # temperature required
    attr_accessor :step_time     # time required
    attr_accessor :type          # list required

    validates :end_temp, numericality: { allow_nil: true }
    validates :infuse_amount, presence: { if: Proc.new { |step| step.infuse_amount_required? } }, numericality: { allow_nil: true }
    validates :ramp_time, numericality: { allow_nil: true, greater_than_or_equal_to: 0 }
    validates :step_temp, numericality: true, presence: true
    validates :step_time, numericality: { greater_than_or_equal_to: 0 }, presence: true
    validates :type, inclusion: { in: %w(Decoction Infusion Temperature) },
                     presence: true

    def infuse_amount_required?
      type == "Infusion"
    end

  end
end; end

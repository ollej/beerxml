module NRB; module BeerXML
  class Water < Record

    attr_accessor :amount      # volume required
    attr_accessor :bicarbonate # float required
    attr_accessor :calcium     # float required
    attr_accessor :chloride    # float required
    attr_accessor :magnesium   # float required
    attr_accessor :notes       # string
    attr_accessor :ph          # float
    attr_accessor :sodium      # float required
    attr_accessor :sulfate     # float required

    validates :amount, numericality: true, presence: true
    validates :bicarbonate, numericality: true, presence: true
    validates :calcium, numericality: true, presence: true
    validates :chloride, numericality: true, presence: true
    validates :magnesium, numericality: true, presence: true
    validates :ph, numericality: { allow_nil: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 14 }
    validates :sodium, numericality: true, presence: true
    validates :sulfate, numericality: true, presence: true

  end
end; end

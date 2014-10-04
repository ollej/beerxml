require 'beerxml/record_validators/percentage_validator'
module NRB; module BeerXML
  class Style < Record

    attr_accessor :abv_max         # float
    attr_accessor :abv_min         # float
    attr_accessor :carb_max        # float
    attr_accessor :carb_min        # float
    attr_accessor :category        # string required
    attr_accessor :category_number # string required
    attr_accessor :color_max       # float required
    attr_accessor :color_min       # float required
    attr_accessor :examples        # text
    attr_accessor :fg_max          # float required
    attr_accessor :fg_min          # float required
    attr_accessor :ibu_max         # float required
    attr_accessor :ibu_min         # float required
    attr_accessor :ingredients     # text
    attr_accessor :notes           # text
    attr_accessor :og_max          # float required
    attr_accessor :og_min          # float required
    attr_accessor :profile         # text
    attr_accessor :style_guide     # string required
    attr_accessor :style_letter    # string required
    attr_accessor :type            # list required

    validates :abv_max, numericality: { greater_than_or_equal_to: 0 }
    validates :abv_min, numericality: { greater_than_or_equal_to: 0 }
    validates :carb_max, numericality: { greater_than_or_equal_to: 0 }
    validates :carb_min, numericality: { greater_than_or_equal_to: 0 }
    validates :category, presence: true
    validates :category_number, presence: true
    validates :color_max, numericality: { greater_than_or_equal_to: 0 }, presence: true
    validates :color_min, numericality: { greater_than_or_equal_to: 0 }, presence: true
    validates :fg_max, numericality: { greater_than_or_equal_to: 0 }, presence: true
    validates :fg_min, numericality: { greater_than_or_equal_to: 0 }, presence: true
    validates :ibu_max, numericality: { greater_than_or_equal_to: 0 }, presence: true
    validates :ibu_min, numericality: { greater_than_or_equal_to: 0 }, presence: true
    validates :og_max, numericality: { greater_than_or_equal_to: 0 }, presence: true
    validates :og_min, numericality: { greater_than_or_equal_to: 0 }, presence: true
    validates :style_guide, presence: true
    validates :style_letter, presence: true
    validates :type, inclusion: { in: %w(Ale Cider Lager Mead Mixed Wheat ) },
                     presence: true

  end
end; end

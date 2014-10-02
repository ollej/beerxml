require 'shared/active_model_lint'

describe NRB::BeerXML::Style do

  it_behaves_like :ActiveModel

  it { should validate_presence_of :category }
  it { should validate_presence_of :category_number }
  it { should validate_presence_of :color_max }
  it { should validate_presence_of :color_min }
  it { should validate_presence_of :fg_max }
  it { should validate_presence_of :fg_min }
  it { should validate_presence_of :ibu_max }
  it { should validate_presence_of :ibu_min }
  it { should validate_presence_of :og_max }
  it { should validate_presence_of :og_min }
  it { should validate_presence_of :style_guide }
  it { should validate_presence_of :style_letter }
  it { should validate_presence_of :type }

  it { should validate_inclusion_of(:type).in_array(%w(Ale Cider Lager Mead Mixed Wheat) ) }

  it { should validate_numericality_of(:abv_max).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:abv_min).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:carb_max).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:carb_min).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:color_max).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:color_min).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:fg_max).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:fg_min).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:ibu_max).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:ibu_min).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:og_max).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:og_min).is_greater_than_or_equal_to(0) }

end

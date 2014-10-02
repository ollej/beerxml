require 'shared/active_model_lint'

describe NRB::BeerXML::Yeast do

  it_behaves_like :ActiveModel

  it { should validate_presence_of :amount }
  it { should validate_presence_of :form }
  it { should validate_presence_of :type }

  it { should validate_inclusion_of(:flocculation).in_array(["High","Low","Medium","Very High"]) }
  it { should validate_inclusion_of(:form).in_array(%w(Culture Dry Liquid Slant )) }
  it { should validate_inclusion_of(:type).in_array(%w(Ale Champagne Lager Wheat Wine)) }

  it { should validate_numericality_of(:max_reuse).only_integer.is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:max_temperature) }
  it { should validate_numericality_of(:min_temperature) }
  it { should validate_numericality_of(:times_cultured).only_integer.is_greater_than_or_equal_to(0) }

end

require 'shared/active_model_lint'
require 'shared/record_typing'

describe NRB::BeerXML::Yeast do

  it_behaves_like :ActiveModel

  it { should validate_presence_of :amount }
  it { should validate_presence_of :form }
  it { should validate_presence_of :type }

  it { should validate_inclusion_of(:flocculation).in_array(["High","Low","Medium","Very High"]).allow_nil }
  it { should validate_inclusion_of(:form).in_array(%w(Culture Dry Liquid Slant )) }
  it { should validate_inclusion_of(:type).in_array(%w(Ale Champagne Lager Wheat Wine)) }

  it { should validate_numericality_of(:max_reuse).only_integer.is_greater_than_or_equal_to(0).allow_nil }
  it { should validate_numericality_of(:max_temperature).allow_nil }
  it { should validate_numericality_of(:min_temperature).allow_nil }
  it { should validate_numericality_of(:times_cultured).only_integer.is_greater_than_or_equal_to(0).allow_nil }

  it_behaves_like :record_typing do
    let(:type) { :yeast }
  end

end

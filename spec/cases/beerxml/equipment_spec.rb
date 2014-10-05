require 'shared/active_model_lint'
require 'shared/record_typing'
describe NRB::BeerXML::Equipment do

  it_behaves_like :ActiveModel

  it { should validate_presence_of :batch_size }
  it { should validate_presence_of :boil_size }

  it { should validate_numericality_of(:batch_size).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:boil_size).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:boil_time).is_greater_than_or_equal_to(0).allow_nil }
  it { should validate_numericality_of(:lauter_tun_deadspace).is_greater_than_or_equal_to(0).allow_nil }
  it { should validate_numericality_of(:top_up_kettle).is_greater_than_or_equal_to(0).allow_nil }
  it { should validate_numericality_of(:top_up_water).is_greater_than_or_equal_to(0).allow_nil }
  it { should validate_numericality_of(:trub_chiller_loss).is_greater_than_or_equal_to(0).allow_nil }
  it { should validate_numericality_of(:tun_specific_heat).is_greater_than_or_equal_to(0).allow_nil }
  it { should validate_numericality_of(:tun_volume).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:tun_weight).is_greater_than_or_equal_to(0).allow_nil }


  it_behaves_like :record_typing do
    let(:type) { :equipment }
  end

end

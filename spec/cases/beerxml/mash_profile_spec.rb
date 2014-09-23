describe NRB::BeerXML::MashProfile do

  it { should validate_presence_of :grain_temp }
  it { should validate_presence_of :mash_steps }

  it { should validate_numericality_of :grain_temp }
  it { should validate_numericality_of(:ph).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(14) }
  it { should validate_numericality_of :sparge_temp }
  it { should validate_numericality_of(:tun_specific_heat).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of :tun_temp }
  it { should validate_numericality_of(:tun_weight).is_greater_than_or_equal_to(0) }


  it 'should start with empty mash steps' do
    expect( subject.mash_steps ).to eq([])
  end

end

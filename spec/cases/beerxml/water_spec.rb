describe NRB::BeerXML::Water do

  it { should validate_presence_of :amount }
  it { should validate_presence_of :bicarbonate }
  it { should validate_presence_of :calcium }
  it { should validate_presence_of :chloride }
  it { should validate_presence_of :magnesium }
  it { should validate_presence_of :sodium }
  it { should validate_presence_of :sulfate }

  it { should validate_numericality_of :amount }
  it { should validate_numericality_of :bicarbonate }
  it { should validate_numericality_of :calcium }
  it { should validate_numericality_of :chloride }
  it { should validate_numericality_of :magnesium }
  it { should validate_numericality_of(:ph).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(14) }

  it { should validate_numericality_of :sodium }
  it { should validate_numericality_of :sulfate }

end

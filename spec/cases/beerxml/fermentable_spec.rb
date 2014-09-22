describe NRB::BeerXML::Fermentable do

  it { should validate_presence_of :amount }
  it { should validate_presence_of :color }
  it { should validate_presence_of :type }
  it { should validate_presence_of :yield }

  it { should validate_numericality_of(:diastatic_power).is_greater_than_or_equal_to(0) }


end

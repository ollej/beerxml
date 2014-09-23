describe NRB::BeerXML::Misc do

  it { should validate_presence_of :amount }
  it { should validate_presence_of :time }
  it { should validate_presence_of :type }
  it { should validate_presence_of :use }

  it { should validate_numericality_of(:amount).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:time).is_greater_than_or_equal_to(0) }

  it { should validate_inclusion_of(:type).in_array(["Fining", "Flavor", "Herb", "Other", "Spice", "Water Agent"]) }
  it { should validate_inclusion_of(:use).in_array(%w(Boil Bottling Mash Primary Secondary)) }

end

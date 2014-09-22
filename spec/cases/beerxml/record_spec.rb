describe NRB::BeerXML::Record do

  it { should validate_presence_of :name }
  it { should validate_presence_of :version }

  it { should validate_numericality_of(:version).only_integer }

end

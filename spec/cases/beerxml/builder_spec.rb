describe NRB::BeerXML::Builder do

  it "returns nil when it can't guess" do
    expect( subject.build("Blark") ).to be_nil
  end


  it 'returns a Equipment when asked' do
    expect( subject.build("Equipment") ).to be_a(NRB::BeerXML::Equipment)
  end


  it 'returns a RecordSet when asked for Equipments' do
    expect( subject.build("Equipments") ).to be_a(NRB::BeerXML::RecordSet)
  end


  it 'returns a Fermentable when asked' do
    expect( subject.build("Fermentable") ).to be_a(NRB::BeerXML::Fermentable)
  end


  it 'returns a RecordSet when asked for Fermentables' do
    expect( subject.build("Fermentables") ).to be_a(NRB::BeerXML::RecordSet)
  end


  it 'returns a Hop when asked' do
    expect( subject.build("Hop") ).to be_a(NRB::BeerXML::Hop)
  end


  it 'returns a RecordSet when asked for Hops' do
    expect( subject.build("Hops") ).to be_a(NRB::BeerXML::RecordSet)
  end


  it 'returns a Mash when asked' do
    expect( subject.build("Mash") ).to be_a(NRB::BeerXML::Mash)
  end


  it 'returns a RecordSet when asked for Mashs' do
    expect( subject.build("Mashs") ).to be_a(NRB::BeerXML::RecordSet)
  end


  it 'returns a MashStep when asked' do
    expect( subject.build("MashStep") ).to be_a(NRB::BeerXML::MashStep)
  end


  it 'returns a RecordSet when asked for MashSteps' do
    expect( subject.build("MashSteps") ).to be_a(NRB::BeerXML::RecordSet)
  end


  it 'returns a Misc when asked' do
    expect( subject.build("Misc") ).to be_a(NRB::BeerXML::Misc)
  end


  it 'returns a RecordSet when asked for Miscs' do
    expect( subject.build("Miscs") ).to be_a(NRB::BeerXML::RecordSet)
  end


  it 'returns a Recipe when asked' do
    expect( subject.build("Recipe") ).to be_a(NRB::BeerXML::Recipe)
  end


  it 'returns a RecordSet when asked for Recipes' do
    expect( subject.build("Recipes") ).to be_a(NRB::BeerXML::RecordSet)
  end


  it 'returns a Style when asked' do
    expect( subject.build("Style") ).to be_a(NRB::BeerXML::Style)
  end


  it 'returns a RecordSet when asked for Styles' do
    expect( subject.build("Styles") ).to be_a(NRB::BeerXML::RecordSet)
  end


  it 'returns a Water when asked' do
    expect( subject.build("Water") ).to be_a(NRB::BeerXML::Water)
  end


  it 'returns a RecordSet when asked for a Waters' do
    expect( subject.build("Waters") ).to be_a(NRB::BeerXML::RecordSet)
  end



  it 'returns a Yeast when asked' do
    expect( subject.build("Yeast") ).to be_a(NRB::BeerXML::Yeast)
  end

  it 'returns a RecordSet when asked for a Yeasts' do
    expect( subject.build("Yeasts") ).to be_a(NRB::BeerXML::RecordSet)
  end

end

require 'beerxml/version'
describe NRB::BeerXML do

  it 'responds to version' do
    expect(subject).to respond_to(:version)
  end


  it 'version is a string' do
    expect(subject.version).to be_a(String)
  end

end

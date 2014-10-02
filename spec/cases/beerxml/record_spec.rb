require 'shared/active_model_lint'
describe NRB::BeerXML::Record do

  it { should validate_presence_of :name }
  it { should validate_presence_of :version }

  it { should validate_numericality_of(:version).only_integer }

  it 'tells you its name' do
    expect(subject.record_type).to be_a(Symbol)
  end

  it_behaves_like :ActiveModel

end

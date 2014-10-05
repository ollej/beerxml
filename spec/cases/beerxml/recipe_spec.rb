require 'shared/active_model_lint'
require 'shared/record_typing'

describe NRB::BeerXML::Recipe do

  it_behaves_like :ActiveModel

  it { should_not validate_presence_of :age }
  it { should_not validate_presence_of :age_temp }
  it { should_not validate_presence_of :asst_brewer }
  it { should validate_presence_of :batch_size }
  it { should validate_presence_of :boil_size }
  it { should validate_presence_of :boil_time }
  it { should validate_presence_of :brewer }
  it { should_not validate_presence_of :carbonation }
  it { should_not validate_presence_of :carbonation_temp }
  it { should_not validate_presence_of :date }
  it { should validate_presence_of :equipment }
  it { should validate_presence_of :fermentables }
  it { should_not validate_presence_of :fermentation_stages }
  it { should_not validate_presence_of :fg }
  it { should_not validate_presence_of :forced_carbonation }
  it { should validate_presence_of :hops }
  it { should_not validate_presence_of :keg_priming_factor }
  it { should validate_presence_of :mash }
  it { should validate_presence_of :miscs }
  it { should_not validate_presence_of :notes }
  it { should_not validate_presence_of :og }
  it { should_not validate_presence_of :primary_age }
  it { should_not validate_presence_of :primary_temp }
  it { should_not validate_presence_of :priming_sugar_equiv }
  it { should_not validate_presence_of :priming_sugar_name }
  it { should_not validate_presence_of :secondary_age }
  it { should_not validate_presence_of :secondary_temp }
  it { should validate_presence_of :style }
  it { should_not validate_presence_of :taste_notes }
  it { should_not validate_presence_of :taste_rating }
  it { should_not validate_presence_of :tertiary_age }
  it { should_not validate_presence_of :tertiary_temp }
  it { should validate_presence_of :type }
  it { should validate_presence_of :waters }
  it { should validate_presence_of :yeasts }

  it { should validate_inclusion_of(:type).in_array([ "All Grain", "Extract", "Partial Mash" ]) }

  it { should validate_numericality_of(:age).is_greater_than_or_equal_to(0).allow_nil }
  it { should validate_numericality_of(:age_temp).allow_nil}
  it { should validate_numericality_of(:batch_size).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:boil_size).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:boil_time).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:carbonation).is_greater_than_or_equal_to(0).allow_nil }
  it { should validate_numericality_of(:carbonation_temp).allow_nil }
  it { should validate_numericality_of(:fermentation_stages).only_integer.allow_nil }
  it { should validate_numericality_of(:fg).allow_nil }
  it { should validate_numericality_of(:og).allow_nil }
  it { should validate_numericality_of(:primary_age).is_greater_than_or_equal_to(0).allow_nil }
  it { should validate_numericality_of(:primary_temp).allow_nil }
  it { should validate_numericality_of(:secondary_age).is_greater_than_or_equal_to(0).allow_nil }
  it { should validate_numericality_of(:secondary_temp).allow_nil }
  it { should validate_numericality_of(:tertiary_age).is_greater_than_or_equal_to(0).allow_nil }
  it { should validate_numericality_of(:tertiary_temp).allow_nil }


  %i(fermentable hop misc water yeast).each do |record_type|
    it "#{record_type}s should be a RecordSet" do
      expect(subject.send("#{record_type}s")).to be_a(NRB::BeerXML::RecordSet)
    end

    it "its #{record_type}s RecordSet should be of type #{record_type}" do
      expect(subject.send("#{record_type}s").record_type).to eq record_type
    end
  end


  shared_examples_for :restricted_assignment do
    it "allows assignment of the correct type" do
      expect{ subject.send("#{record_type}=", good) }.to_not raise_exception
    end

    it 'disallows non-Styles' do
      expect{ subject.send("#{record_type}=", bad) }.to raise_exception
    end
  end

  context "assigning equipment" do
    let(:bad) { NRB::BeerXML::Hop.new }
    let(:good) { NRB::BeerXML::Equipment.new }
    let(:record_type) { :equipment }
    it_behaves_like :restricted_assignment
  end

  context "assigning style" do
    let(:bad) { NRB::BeerXML::Hop.new }
    let(:good) { NRB::BeerXML::Style.new }
    let(:record_type) { :style }
    it_behaves_like :restricted_assignment
  end

  it_behaves_like :record_typing do
    let(:type) { :recipe }
  end

end

require 'beerxml/record_validators/percentage_validator'
module NRB
  module Fake
    class FakePercentageObject
      include ActiveModel::Model
      attr_accessor :percentage
      validates :percentage, percentage: true
    end
  end
end

describe NRB::BeerXML::RecordValidators::PercentageValidator do

  shared_examples_for :a_borked_record do

    it 'is invalid' do
      expect(record).to_not be_valid
    end

    it 'tells you why the record is invalid' do
      record.valid?
      expect(record.errors[:percentage]).to include('must be a BeerXML percentage (a number between 0 & 100)')
    end

  end


  let(:record) { NRB::Fake::FakePercentageObject.new percentage: percentage }

  context 'percentage between 0 & 100' do
    let(:percentage) { 99 }
    it 'is valid' do
      expect(record).to be_valid
    end
  end

  context 'non numeric percentage' do
    let(:percentage) { :a }
    it_behaves_like :a_borked_record
  end

  context 'percentage over 100' do
    let(:percentage) { 101 }
    it_behaves_like :a_borked_record
  end

  context 'negative percentage' do
    let(:percentage) { -1 }
    it_behaves_like :a_borked_record
  end

end

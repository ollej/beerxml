require 'beerxml/record_validators/boolean_validator'
module NRB
  module Fake
    class FakeBooleanObject
      include ActiveModel::Model
      attr_accessor :boolean
      validates :boolean, boolean: true
    end
  end
end

describe NRB::BeerXML::RecordValidators::BooleanValidator do

  shared_examples_for :a_borked_record do

    it 'is invalid' do
      expect(record).to_not be_valid
    end

    it 'tells you why the record is invalid' do
      record.valid?
      expect(record.errors[:boolean]).to include('must be false or true')
    end

  end


  let(:record) { NRB::Fake::FakeBooleanObject.new boolean: boolean }


  context 'an invalid record' do
    let(:boolean) { :false }
    it_behaves_like :a_borked_record
  end


  context 'false is valid' do
    let(:boolean) { false }
    it { expect(record).to be_valid }
  end


  context 'true is valid' do
    let(:boolean) { true }
    it { expect(record).to be_valid }
  end



end

require 'nrb/beerxml/record_validators/percentage_validator'
module NRB
  module Fake
    class FakePercentage
      include ActiveModel::Model
      attr_accessor :percentage
    end
    class NoMaxFakePercentage < FakePercentage
      validates :percentage, percentage: { give_110: true }
    end
    class NoMinFakePercentage < FakePercentage
      validates :percentage, percentage: { allow_negative: true }
    end
    class VanillaFakePercentage < FakePercentage
      validates :percentage, percentage: true
    end
  end
end

describe NRB::BeerXML::RecordValidators::PercentageValidator do

  let(:nan) { :a }

  shared_examples_for :a_borked_record do

    it 'is invalid' do
      expect(record).to_not be_valid
    end

    it 'tells you why the record is invalid' do
      record.valid?
      expect(record.errors[:percentage]).to include(message)
    end

  end


  shared_examples_for :rejects_nan do
    let(:percentage) { nan }
    it_behaves_like :a_borked_record
  end


  shared_examples_for :goldilocks do
    let(:percentage) { okay }
    it 'is valid' do
      expect(record).to be_valid
    end
  end


  shared_examples_for :rejects_large do
    let(:percentage) { too_big }
    it_behaves_like :a_borked_record
  end


  shared_examples_for :rejects_small do
    let(:percentage) { too_small }
    it_behaves_like :a_borked_record
  end


  context 'a vanilla percentage validator' do
    let(:okay) { 88 }
    let(:message) { 'must be a percentage (between 0 & 100)' }
    let(:record) { NRB::Fake::VanillaFakePercentage.new percentage: percentage }
    let(:too_big) { 101 }
    let(:too_small) { -1 }

    it_behaves_like :goldilocks
    it_behaves_like :rejects_large
    it_behaves_like :rejects_nan
    it_behaves_like :rejects_small
  end


  context 'with no maximum' do
    let(:okay) { 1000 }
    let(:message) { 'must be a percentage (less than 100)' }
    let(:record) { NRB::Fake::NoMaxFakePercentage.new percentage: percentage }
    let(:too_small) { -1 }

    it_behaves_like :goldilocks
    it_behaves_like :rejects_small
    it_behaves_like :rejects_nan
  end


  context 'with no minimum' do
    let(:okay) { -10 }
    let(:message) { 'must be a percentage (greater than 0)' }
    let(:record) { NRB::Fake::NoMinFakePercentage.new percentage: percentage }
    let(:too_big) { 101 }

    it_behaves_like :goldilocks
    it_behaves_like :rejects_large
    it_behaves_like :rejects_nan
  end

end

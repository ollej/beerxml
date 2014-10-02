describe NRB::BeerXML::RecordSet do

  context "initialization" do

    described_class.valid_record_types.each do |record_type|
      it "does not blow up given #{record_type}" do
        expect { described_class.new record_type: record_type }.to_not raise_exception
      end
    end

    it 'blows up when given a blark' do
        expect { described_class.new record_type: :blark }.to raise_exception
    end

  end


  context 'adding records' do

    let(:invalid_record) { NRB::BeerXML::Mash.new }
    let(:record_set) { described_class.new record_type: record_type }
    let(:record_type) { :hop }
    let(:valid_record) { NRB::BeerXML::Hop.new }

    it 'lets you add valid records' do
      expect { record_set << valid_record }.to_not raise_exception
    end

    it "doesen't let you add invalid records" do
      expect { record_set << inalid_record }.to raise_exception
    end


  end

end

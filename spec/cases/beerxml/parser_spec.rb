describe NRB::BeerXML::Parser do

  context 'Parsing' do

    let(:base_dir) { File.expand_path File.join('..','..','..'), __FILE__ }
    let(:fixture_dir) { File.join base_dir,'fixtures' }
    let(:fixture_path) { File.join fixture_dir, 'recipes.xml' }

    it 'does not raise error when parsing a path name' do
      expect { subject.parse fixture_path }.to_not raise_error
    end


    it 'does not raise error when parsing a stream' do
      expect { subject.parse File.open(fixture_path) }.to_not raise_error
    end


    it 'raises an error when parsing something else' do
      expect { subject.parse Array.new }.to raise_error
    end


    it 'returns a NRB::BeerXML::Parser' do
      expect( subject.parse fixture_path ).to be_a(NRB::BeerXML::RecordSet)
    end

  end

end

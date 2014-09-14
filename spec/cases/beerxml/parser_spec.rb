describe NRB::BeerXML::Parser do

  context 'Parsing' do

    let(:base_dir) {
      File.expand_path File.join('..','..','..','fixtures'), __FILE__
    }

    let(:file_path) { File.join base_dir, 'recipes.xml' }

    it 'does not raise error when parsing a path name' do
      expect { subject.parse file_path }.to_not raise_error
    end

  end

end

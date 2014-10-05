require 'test/unit/assertions'
require 'active_model/lint'

shared_examples_for :record_typing do

  let(:all_types) { %i( equipment fermentable hop mash mash_step misc recipe style water yeast ) }

  it 'correctly answers to its own type' do
    expect subject.send("#{type}?")
  end

  it 'correctly answers to other types' do
    (all_types - [type]).each do |question|
      expect ! subject.send("#{question}?")
    end
  end

end


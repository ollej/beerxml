require 'shared/active_model_lint'

describe NRB::BeerXML::Hop do

  it_behaves_like :ActiveModel

  it { should validate_presence_of :alpha }
  it { should validate_presence_of :amount }
  it { should validate_presence_of :time }
  it { should validate_presence_of :use }

  it { should validate_inclusion_of(:form).in_array( ["Leaf", "Pellet", "Plug"] ) }

  it { should validate_numericality_of(:amount).is_greater_than_or_equal_to(0) }
  it { should validate_inclusion_of(:type).in_array(%w(Aroma Bittering Both) ) }
  it { should validate_inclusion_of(:use).in_array( [ "Aroma", "Boil", "Dry Hop", "First Wort", "Mash" ] ) }

  it { should validate_numericality_of(:time).is_greater_than_or_equal_to(0) }


end

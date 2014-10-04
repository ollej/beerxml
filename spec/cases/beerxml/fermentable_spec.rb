require 'shared/active_model_lint'

describe NRB::BeerXML::Fermentable do

  it_behaves_like :ActiveModel

  it { should validate_presence_of :amount }
  it { should validate_presence_of :color }
  it { should validate_presence_of :type }
  it { should validate_presence_of :yield }

  it { should validate_inclusion_of(:type).in_array( [ "Adjunct", "Dry Extract", "Extract", "Grain", "Sugar" ] ) }

  it { should validate_numericality_of(:diastatic_power).is_greater_than_or_equal_to(0) }


end

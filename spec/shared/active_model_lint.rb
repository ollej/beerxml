require 'test/unit/assertions'

shared_examples_for :ActiveModel do
  include ActiveModel::Lint::Tests
  include Minitest::Assertions

  attr_accessor :assertions

  before do
    self.assertions = 0
  end

  ActiveModel::Lint::Tests.public_instance_methods.grep(/^test/).each do |m|
    example m do; send m; end
  end

  def model
    subject
  end

end

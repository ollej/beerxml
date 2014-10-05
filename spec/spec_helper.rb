$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'nrb/beerxml'
require 'active_model'
require 'shoulda/matchers'

RSpec.configure do |config|
  config.order = :random
end

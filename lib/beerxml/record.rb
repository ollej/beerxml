require 'active_model'
module NRB
  module BeerXML
    class Record
      include ActiveModel::Model

      attr_accessor :name
      attr_accessor :version

      validates :name, presence: true
      validates :version, presence: true, numericality: { only_integer: true }

    end
  end
end

require 'active_model'
module NRB
  module BeerXML
    class Record
      include ActiveModel::Model
      extend ActiveModel::Callbacks

      define_model_callbacks :initialize, only: :after

      attr_accessor :name
      attr_accessor :version

      validates :name, presence: true
      validates :version, presence: true, numericality: { only_integer: true }


      def initialize(*args)
        super
        run_callbacks :initialize
      end

    end
  end
end

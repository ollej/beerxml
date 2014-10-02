require 'active_model'
module NRB
  module BeerXML
    class Record
      include ActiveModel::Model
      extend ActiveModel::Callbacks
      extend ActiveModel::Naming

      define_model_callbacks :initialize, only: :after

      attr_accessor :name
      attr_accessor :version

      validates :name, presence: true
      validates :version, presence: true, numericality: { only_integer: true }


      def initialize(*args)
        super
        run_callbacks :initialize
      end


      def record_type
        self.class.name.split(/::/).last.downcase.to_sym
      end


      def equipment?;    am_a? :equipment; end
      def fermentable?;  am_a? :fermentable; end
      def hop?;          am_a? :hop; end
      def mash_profile?; am_a? :mash_profile; end
      def mash_step?;    am_a? :mash_step; end
      def misc?;         am_a? :misc; end
      def recipe?;       am_a? :recipe; end
      def style?;        am_a? :style; end
      def water?;        am_a? :water; end
      def yeast?;        am_a? :yeast; end

      def persisted?; false; end

    private

      def am_a?(question); record_type == question; end

    end
  end
end

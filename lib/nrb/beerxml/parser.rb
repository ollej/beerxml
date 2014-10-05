require 'nokogiri'

module NRB; module BeerXML
  class Parser

    include Inflector

    attr_reader :builder, :reader

    def initialize(builder: Builder.new, reader: Nokogiri::XML)
      @builder = builder
      @reader = reader
    end


    def parse(entry)
      doc = case entry
            when IO
              parse_xml entry
            when String
              parse_path(file: entry)
            else
              raise ArgumentError "Don't know how to parse a #{entry.class}"
            end
      parse_node doc.root
    end

  private

    def assign_attribute(object, node)
      return unless object
      return unless attribute_node?(node)
      meth = guess_attribute_assignment_method node
      if object.respond_to? meth
        object.send meth, attribute_value(node)
      end
    end


    def assign_child_to_parent(parent, child)
      meth = guess_child_assignment_method parent, child
      parent.respond_to?(meth) && parent.send(meth, child)
    end


    def attribute_node?(node)
      node.children.size == 1 && node.children.first.text?
    end


    def attribute_value(node)
      node.children.first.text
    end


    def guess_attribute_assignment_method(node)
      node.name.downcase + '='
    end


    def guess_child_assignment_method(parent, child)
      # Smelly, needs refactor
      return :<< if parent.is_a? RecordSet
      name = if child.is_a? RecordSet
               "#{child.record_type.to_s}s"
             else
               child.class.name.split(/::/).last
             end
      underscore(name) + '='
    end


    def guess_class_name(string)
      camelize string.downcase
    end


    def parse_node(node,parent=nil)
      return unless node

      if attribute_node?(node)
        assign_attribute parent, node

      else

        obj = builder.build guess_class_name(node.name)

        node.children.each do |child|
          parse_node child, obj
        end

        assign_child_to_parent parent, obj

        obj
      end
    end


    def parse_path(file: nil)
      f = File.open(file)
      doc = parse_xml(f)
      f.close
      doc
    end


    def parse_xml(stream)
      reader.parse(stream) do |config|
        config.noblanks
      end
    end

  end
end; end

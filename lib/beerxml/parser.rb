require 'nokogiri'

module NRB; module BeerXML
  class Parser
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
     obj = parse_node doc.root
puts obj.inspect
obj
    end

  private

    def assign_from_xml(object, node)
      return unless object
      return unless attribute_node?(node)
      meth = guess_assignment_method node
      if object.respond_to? meth
        object.send meth, attribute_value(node)
      end
    end


    def attribute_node?(node)
      node.children.size == 1 && node.children.first.text?
    end


    def attribute_value(node)
      node.children.first.text
    end


    def guess_assignment_method(node)
      node.name.downcase + '='
    end


    def guess_class_name(string)
      string.downcase.capitalize
    end


    def parse_node(node,parent=nil,counter=-1)
counter += 1
#puts counter.to_s + "  " * counter + "#{node.name} children: #{node.children.size}"
      return unless node

      if attribute_node?(node)
        assign_from_xml parent, node
        parent

      else

        obj = builder.build guess_class_name(node.name)

        node.children.each do |child|
          parse_node child, obj, counter
        end

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

# coding: utf-8
lib = File.expand_path(File.join('..','lib'), __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'beerxml/version'

Gem::Specification.new do |spec|
  spec.name          = "nrb-beerxml"
  spec.version       = NRB::BeerXML::VERSION
  spec.authors       = ["Dean Brundage"]
  spec.email         = ["dean@newrepublicbrewing.com"]
  spec.summary       = 'BeerXML parser'
  spec.description   = 'A BeerXML parser based on the original BeerXML gem'
  spec.homepage      = ""
  spec.license       = "GPL-3"

  spec.files = [
                 'README.md',
                 'LICENSE',
                 'lib/beerxml.rb',
                 'lib/beerxml/parser.rb',
                 'lib/beerxml/record_set.rb',
                 'lib/beerxml/schema.rb',
                 'lib/beerxml/version.rb',
                 'schema/fermentable.yml',
                 'schema/hop.yml',
                 'schema/misc.yml',
                 'schema/record_sets.yml',
                 'schema/yeast.yml',
               ]

  spec.test_files = [
                      'spec/spec_helper.rb',
                      'spec/cases/beerxml/parser_spec.rb',
                      'spec/cases/beerxml/schema_spec.rb',
                      'spec/cases/beerxml/version_spec.rb',
                      'spec/fixtures/recipes.xml'
                    ]

  spec.require_paths = ["lib"]

  spec.add_dependency 'nokogiri'
  spec.add_dependency 'ruby-units'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "rspec"
end

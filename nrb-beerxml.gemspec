# coding: utf-8
lib = File.expand_path(File.join('..','lib'), __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'beerxml/version'

Gem::Specification.new do |s|
  s.name          = "nrb-beerxml"
  s.version       = NRB::BeerXML::VERSION
  s.authors       = ["Dean Brundage"]
  s.email         = ["dean@newrepublicbrewing.com"]
  s.summary       = 'BeerXML parser'
  s.description   = 'A BeerXML parser based on the original BeerXML gem'
  s.homepage      = ""
  s.license       = "GPL-3"
  s.required_ruby_version = '>=2'

  s.files = [
                 'README.md',
                 'LICENSE',
                 'lib/beerxml.rb',
                 'lib/beerxml/hop.rb',
                 'lib/beerxml/parser.rb',
                 'lib/beerxml/record.rb',
                 'lib/beerxml/record_set.rb',
                 'lib/beerxml/schema.rb',
                 'lib/beerxml/version.rb',
                 'schema/fermentable.yml',
                 'schema/hop.yml',
                 'schema/misc.yml',
                 'schema/record_sets.yml',
                 'schema/yeast.yml',
               ]

  s.test_files = [
                      'spec/spec_helper.rb',
                      'spec/cases/beerxml/parser_spec.rb',
                      'spec/cases/beerxml/schema_spec.rb',
                      'spec/cases/beerxml/version_spec.rb',
                      'spec/fixtures/recipes.xml'
                    ]

  s.require_paths = ["lib"]

  s.add_dependency 'activemodel'
  s.add_dependency 'nokogiri'
  s.add_dependency 'ruby-units'

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rspec"
  s.add_development_dependency "shoulda"

end

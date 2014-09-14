# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nrb/beerxml/version'

Gem::Specification.new do |spec|
  spec.name          = "nrb-beerxml"
  spec.version       = NRB::Beerxml::VERSION
  spec.authors       = ["Dean Brundage"]
  spec.email         = ["dean@newrepublicbrewing.com"]
  spec.summary       = 'BeerXML parser'
  spec.description   = 'A BeerXML parser based on the original BeerXML gem'
  spec.homepage      = ""
  spec.license       = "GPL-3"

  spec.files = [
                 'README.md',
                 'LICENSE',
                 'lib/nrb/beerxml.rb',
                 'lib/nrb/beerxml/parser.rb',
                 'lib/nrb/beerxml/record_set.rb',
                 'lib/nrb/beerxml/schema.rb',
                 'lib/nrb/beerxml/version.rb',
                 'schema/fermentable.yml',
                 'schema/hop.yml',
                 'schema/misc.yml',
                 'schema/record_sets.yml',
                 'schema/yeast.yml',
               ]

  spec.test_files = [
                      'spec/spec_helper.rb'
                    ]

  spec.require_paths = ["lib"]

  spec.add_dependency 'nokogiri'
  spec.add_dependency 'ruby-units'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "guard-rspec", "~> 2.0"
  spec.add_development_dependency "rspec", "~> 2.0"
end

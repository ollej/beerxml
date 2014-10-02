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
              'lib/beerxml/builder.rb',
              'lib/beerxml/equipment.rb',
              'lib/beerxml/fermentable.rb',
              'lib/beerxml/hop.rb',
              'lib/beerxml/mash.rb',
              'lib/beerxml/mash_step.rb',
              'lib/beerxml/misc.rb',
              'lib/beerxml/parser.rb',
              'lib/beerxml/recipe.rb',
              'lib/beerxml/record.rb',
              'lib/beerxml/record_set.rb',
              'lib/beerxml/record_validators.rb',
              'lib/beerxml/record_validators/boolean_validator.rb',
              'lib/beerxml/record_validators/percentage_validator.rb',
              'lib/beerxml/style.rb',
              'lib/beerxml/version.rb',
              'lib/beerxml/water.rb',
              'lib/beerxml/yeast.rb'
            ]

  s.test_files = [
                   'spec/cases/beerxml/builder_spec.rb',
                   'spec/cases/beerxml/equipment_spec.rb',
                   'spec/cases/beerxml/fermentable_spec.rb',
                   'spec/cases/beerxml/hop_spec.rb',
                   'spec/cases/beerxml/mash_spec.rb',
                   'spec/cases/beerxml/mash_step_spec.rb',
                   'spec/cases/beerxml/misc_spec.rb',
                   'spec/cases/beerxml/parser_spec.rb',
                   'spec/cases/beerxml/recipe_spec.rb',
                   'spec/cases/beerxml/record_set_spec.rb',
                   'spec/cases/beerxml/record_spec.rb',
                   'spec/cases/beerxml/record_validators/boolean_validator_spec.rb',
                   'spec/cases/beerxml/record_validators/percentage_validator_spec.rb',
                   'spec/cases/beerxml/style_spec.rb',
                   'spec/cases/beerxml/version_spec.rb',
                   'spec/cases/beerxml/water_spec.rb',
                   'spec/cases/beerxml/yeast_spec.rb',
                   'spec/cases/beerxml_spec.rb',
                   'spec/fixtures/equipment.xml',
                   'spec/fixtures/recipes.xml',
                   'spec/shared/active_model_lint.rb',
                   'spec/shared/record_typing.rb',
                   'spec/spec_helper.rb'
                 ]

  s.require_paths = ["lib"]

  s.add_dependency 'activemodel'
  s.add_dependency 'nokogiri'

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rspec"
  s.add_development_dependency "shoulda"

end

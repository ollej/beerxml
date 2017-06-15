# coding: utf-8
lib = File.expand_path(File.join('..','lib'), __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nrb/beerxml/version'

Gem::Specification.new do |s|
  s.name          = 'nrb-beerxml'
  s.version       = NRB::BeerXML.version
  s.authors       = ['Dean Brundage']
  s.email         = ['dean@newrepublicbrewing.com']
  s.summary       = 'BeerXML parser'
  s.description   = 'Parses BeerXML files into ruby objects'
  s.homepage      = ""
  s.license       = "GPL-3"
  s.required_ruby_version = '>=2'

  s.require_paths = ['lib']

  s.add_dependency 'activemodel'
  s.add_dependency 'nokogiri'

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rspec"
  s.add_development_dependency "shoulda"
  s.add_development_dependency "test-unit"

  s.files = [
              'README.md',
              'LICENSE',
              'lib/nrb/beerxml.rb',
              'lib/nrb/beerxml/builder.rb',
              'lib/nrb/beerxml/equipment.rb',
              'lib/nrb/beerxml/fermentable.rb',
              'lib/nrb/beerxml/hop.rb',
              'lib/nrb/beerxml/inflector.rb',
              'lib/nrb/beerxml/mash.rb',
              'lib/nrb/beerxml/mash_step.rb',
              'lib/nrb/beerxml/misc.rb',
              'lib/nrb/beerxml/parser.rb',
              'lib/nrb/beerxml/recipe.rb',
              'lib/nrb/beerxml/record.rb',
              'lib/nrb/beerxml/record_set.rb',
              'lib/nrb/beerxml/record_validators.rb',
              'lib/nrb/beerxml/record_validators/boolean_validator.rb',
              'lib/nrb/beerxml/record_validators/percentage_validator.rb',
              'lib/nrb/beerxml/style.rb',
              'lib/nrb/beerxml/version.rb',
              'lib/nrb/beerxml/water.rb',
              'lib/nrb/beerxml/yeast.rb',
              'nrb-beerxml.gemspec'
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

end

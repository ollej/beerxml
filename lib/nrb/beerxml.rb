module NRB
  module BeerXML

    autoload :Builder,          'nrb/beerxml/builder'
    autoload :Equipment,        'nrb/beerxml/equipment'
    autoload :Fermentable,      'nrb/beerxml/fermentable'
    autoload :Hop,              'nrb/beerxml/hop'
    autoload :Inflector,        'nrb/beerxml/inflector'
    autoload :Mash,             'nrb/beerxml/mash'
    autoload :MashStep,         'nrb/beerxml/mash_step'
    autoload :Misc,             'nrb/beerxml/misc'
    autoload :Parser,           'nrb/beerxml/parser'
    autoload :Recipe,           'nrb/beerxml/recipe'
    autoload :Record,           'nrb/beerxml/record'
    autoload :RecordSet,        'nrb/beerxml/record_set'
    autoload :RecordValidators, 'nrb/beerxml/record_validators'
    autoload :Style,            'nrb/beerxml/style'
    autoload :Water,            'nrb/beerxml/water'
    autoload :Yeast,            'nrb/beerxml/yeast'

  end
end

defined?(BeerXML) || BeerXML = NRB::BeerXML

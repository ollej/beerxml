module NRB
  module BeerXML

    autoload :Builder,          'beerxml/builder'
    autoload :Equipment,        'beerxml/equipment'
    autoload :Fermentable,      'beerxml/fermentable'
    autoload :Hop,              'beerxml/hop'
    autoload :Inflector,        'beerxml/inflector'
    autoload :Mash,             'beerxml/mash'
    autoload :MashStep,         'beerxml/mash_step'
    autoload :Misc,             'beerxml/misc'
    autoload :Parser,           'beerxml/parser'
    autoload :Recipe,           'beerxml/recipe'
    autoload :Record,           'beerxml/record'
    autoload :RecordSet,        'beerxml/record_set'
    autoload :RecordValidators, 'beerxml/record_validators'
    autoload :Style,            'beerxml/style'
    autoload :Water,            'beerxml/water'
    autoload :Yeast,            'beerxml/yeast'

  end
end

defined?(BeerXML) || BeerXML = NRB::BeerXML

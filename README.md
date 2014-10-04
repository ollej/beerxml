# NRB::Beerxml &ndash; A [BeerXML](http://www.beerxml.com/) parser

[![Code Climate](https://codeclimate.com/github/NewRepublicBrewing/beerxml/badges/gpa.svg)](https://codeclimate.com/github/NewRepublicBrewing/beerxml)


## Install

Add this line to your application's Gemfile:

```ruby
gem 'nrb-beerxml'
```

And then execute:

    % bundle

Or install it yourself as:

    % gem install nrb-beerxml

## Parse

Parse a BeerXML file

```ruby
parser = NRB::BeerXML::Parser.new
parser.parse file_path
=> #<NRB::BeerXML::Equipment:0x007fbe501e4298 @name="Brew Pot", ...>
```

`parse` can handle a `String` pathname or an `IO` containing the BeerXML.

### Builder

The parser uses a builder class to construct `NRB::BeerXML::Record` objects.  If you would rather get back some other class of object (for example a `ActiveRecord` model) just give it your own builder class at initialization.

```ruby
parser = NRB::BeerXML::Parser.new buider: MyBuilder
```

Your builder should implement a `build(type)` method which returns a new object of the requested type.  `type` will be an underscored string.

### Reader

NRB::BeerXML uses Nokogiri by default.  If you want to use another reader, simply pass the class name to the Parser's initializer.

```ruby
parser = NRB::BeerXML::Parser.new reader: SomeXMLReader
```

The reader should implement a `parse(stream)` method which returns a document.  The document object should implement `#children`, `#name`, `#root`, `#text` &amp; `#text?`

## Contribute

1. [Fork me](https://github.com/NewRepublicBrewing/nrb-beerxml/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some beers'`)
4. Push to the branch (`git push origin my-new-beer`)
5. Create a Pull Request

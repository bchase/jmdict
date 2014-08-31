# JMDict

A sloppy JMDict parser

## Installation

Add this line to your application's Gemfile:

    gem 'jmdict', github: 'bchase/jmdict'

And then execute:

    $ bundle

## Usage

To e.g. seed a DB:

```ruby
JMDict.each_entry do |entry|
  ::Entry.create \
    eid:     entry.eid,
    kanji:   entry.kanji,
    kana:    entry.kana,
    glosses: entry.glosses,
    pos:     entry.pos
end
```

> NOTE: This will take an absurdly long time.

## Contributing

1. Fork it ( https://github.com/bchase/jmdict/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

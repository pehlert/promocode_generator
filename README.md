# Promocode Generator

Generates save and unique (when used with AR) codes which can be handed to customers for promotional campaigns.

## Installation

Add this line to your application's Gemfile:

    gem 'promocode_generator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install promocode_generator

## Usage

Without Rails:
  
  Use PromocodeGenerator.generate(length) to produce a promotional code of the desired length.

With Rails:

  In your model, use the promocode_attribute method to automatically generate a promotional code of length 8 in the before_create hook:
  
  ```ruby
  class Campaign < ActiveRecord::Base
    promocode_attribute :code
  end
  ```
  
  Basic uniqueness validation comes by default so that codes are generated until a non-existing code is found in the db. Provide the :reject_if option to customize:
  `promocode_attribute :code, :reject_if => Proc.new { |code| ModelA.where(:code => code).any? }`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

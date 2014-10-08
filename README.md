# Digest::Simple

**Digest::Simple** is a class that minimun implement for non block message digest.

## Usage

Digest::Simple depends only one method `finish`.

```ruby
module Digest
  class Prime31 < Simple
    def initialize
      @prime = 31
      # should be call Digest::Simple#initialize
      super
    end
  
    def finish
      result = 0
      # @buffer is a internal variable
      @buffer.unpack("C*").each do |c|
        result += (c * @prime)
      end
      [result & 0xffffffff].pack("N")
    end
  end
end

p Digest::Prime31.hexdigest("abc" * 1000) #=> "008b1190"
```

## APIs

All methods in **Digest::Class**

## Installation

Add this line to your application's Gemfile:

    gem 'digest-simple'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install digest-simple

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

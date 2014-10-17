# ExceptionCop

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'exception_cop'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install exception_cop

## Usage

require 'exception_cop'

irb(main):003:0> raise
RuntimeError:
        from (irb):3
        from F:/Ruby193/bin/irb:12:in `<main>'
irb(main):004:0> ExceptionCop.configure{|c| c.white_list=[RuntimeError]}
=> nil
irb(main):005:0> raise
=> nil
irb(main):006:0> ExceptionCop.reset
=> nil
irb(main):006:0> raise
RuntimeError:
        from (irb):6
        from F:/Ruby193/bin/irb:12:in `<main>'


## Contributing

1. Fork it ( http://github.com/<my-github-username>/exception_cop/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# FacebookScraper

You're hosting OpenGraphObjects for Facebook?
Ever noticed, when you updated your objects, Facebook won't recognize
these changes?

According to FacebookDocs, they will scrape
"Every 7 days after the first scrape".

**FacebookScraper** for the rescue!

## Installation

Add this line to your application's Gemfile:

    gem 'facebook_scraper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install facebook_scraper

## Example

```ruby
FacebookScraper.trigger_with(url_to_your_open_graph_object)
```

## Example (Using Rails)

```ruby
class AvatarsController
  after_action :trigger_facebook_scraper, only: [:update]

  # ...

  private

  # NOTE: The `background do ... end` part is optional
  def trigger_facebook_scraper
    background do
      FacebookScraper.trigger_with(url_for(@avatar))
    end
  end

  # Run a piece of code in parallel
  def background
    Thread.new do
      yield
      ActiveRecord::Base.connection.close
    end
  end

  # ...
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

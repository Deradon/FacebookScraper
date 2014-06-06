require 'facebook_scraper/scrape'
require 'facebook_scraper/status'
require 'facebook_scraper/version'

module FacebookScraper
  def self.trigger_with(url)
    Scrape.create(url).status
  end
end

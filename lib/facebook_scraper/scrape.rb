# require 'net/http'
require 'json'

module FacebookScraper
  class Scrape
    GRAPH_URL = 'https://graph.facebook.com'

    attr_reader :url
    attr_reader :status

    def initialize(url)
      @url = url
    end

    def self.create(url)
      new(url).tap { |scraper| scraper.run }
    end

    def run
      if body["error"]
        @status = Status.new(:failed)
      else
        @status = Status.new(:success)
      end
    end

  private

    def body
      @body ||= JSON.parse(res.body)
    end

    def res
      @res ||= Net::HTTP.post_form(uri, post_data)
    end

    def uri
      @uri ||= URI(GRAPH_URL)
    end

    def post_data
      {
        id: url,
        scrape: true
      }
    end
  end # -- Scrape
end # -- FacebookScraper

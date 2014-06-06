require 'spec_helper'

describe FacebookScraper::Scrape do
  let(:valid_url) { "http://imdb.com" }
  let(:invalid_url) { "htt://example.com" }

  subject { described_class.create(valid_url) }

  context "when given valid :url" do
    its(:url) { should eq(valid_url) }

    it "is successful" do
      expect(subject.status.success?).to eq(true)
    end
  end

  context "when given no :url" do
    it "raises an ArgumentError" do
      expect { described_class.create }.to raise_error(ArgumentError)
    end
  end

  context "when given invalid :url" do
    subject { described_class.create(invalid_url) }

    it "failed" do
      expect(subject.status.failed?).to eq(true)
    end
  end
end # -- FacebookScraper::Scrape

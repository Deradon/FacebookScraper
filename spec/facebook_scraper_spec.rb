require "spec_helper"

describe FacebookScraper do
  let(:valid_url) { "http://imdb.com" }
  let(:invalid_url) { "htt://example.com" }

  describe ".trigger_with" do
    subject { described_class.trigger_with(valid_url) }

    context "without options" do
      it "raises an ArgumentError" do
        expect { described_class.trigger_with }.to raise_error(ArgumentError)
      end
    end

    context "with valid url" do
      it "succeeds" do
        expect(subject.success?).to eq(true)
      end
    end

    context "with invalid url" do
      subject { described_class.trigger_with(invalid_url) }

      it "fails" do
        expect(subject.failed?).to eq(true)
      end
    end
  end # .trigger_with
end # -- FacebookScraper

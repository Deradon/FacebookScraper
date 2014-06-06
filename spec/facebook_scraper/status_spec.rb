require "spec_helper"

describe FacebookScraper::Status do
  context "when given :success as option" do
    subject { described_class.new(:success) }

    its(:success?) { should eq(true) }
    its(:failed?) { should eq(false) }
  end
  context "when given :failed as option" do
    let(:error) { ArgumentError.new }
    subject { described_class.new(:failed, error) }

    its(:success?) { should eq(false) }
    its(:failed?) { should eq(true) }
    its(:error) { should eq(error) }
  end
  context "when given :invalid as option" do
    it "raises an ArgumentError" do
      expect { described_class.new(:invalid) }.to raise_error(ArgumentError)
    end
  end
  context "when given no option" do
    it "raises an ArgumentError" do
      expect { described_class.new }.to raise_error(ArgumentError)
    end
  end
end # -- FacebookScraper::Status

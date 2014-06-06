module FacebookScraper
  class Status
    VALID_STATUS = [:success, :failed]

    attr_reader :error

    def initialize(status, error = nil)
      fail ArgumentError unless VALID_STATUS.include?(status)

      @status = status
      @error = error
    end

    def success?
      @status == :success
    end

    def failed?
      @status == :failed
    end
  end # -- Status
end # -- FacebookScraper

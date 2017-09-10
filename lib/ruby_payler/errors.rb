module RubyPayler
  # Base error class for all RubyPayler errors
  class Error < RuntimeError
    def code
      raise NotImplementedError
    end

    def message
      raise NotImplementedError
    end
  end

  # Faraday errors
  class FailedRequest < Error
    def code
      'FailedRequest'
    end

    def message
      to_s
    end
  end

  # Response.body contains error
  class ResponseWithError < Error
    attr_reader :error

    def initialize(error)
      @error = error
    end

    def code
      error.code
    end

    def message
      error.message
    end

    def to_s
      "#{self.class}-#{code}-#{message}"
    end
  end
end

require 'digest'

module Digest
  class Simple < Class
    VERSION = "2.0.0"

    def initialize
      @buffer = ""
    end

    def reset
      @buffer.clear
      self
    end

    def update(str)
      @buffer += str
      self
    end
    alias << update

    def block_length
      0
    end

    private

    def finish
      fail NotImplementedError, "must be defined finish method"
    end
  end
end

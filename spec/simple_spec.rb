require 'digest/simple'

module Digest
  class Prime31 < Simple
    def initialize
      @prime = 31
      super
    end

    def finish
      result = 0
      @buffer.unpack("C*").each do |c|
        result += (c * @prime)
      end
      [result & 0xffffffff].pack("N")
    end
  end
end

describe Digest::Simple do
  it "#initialize" do
    expect(Digest::Simple.new).to be_a_kind_of(Digest::Class)
  end

  it "#update" do
    s = Digest::Prime31.new
    expect(s.update("abc").object_id).to eq(s.object_id)
  end

  it "#reset" do
    s = Digest::Prime31.new
    expect(s.hexdigest).to eq("00000000")
    s.update("abc")
    expect(s.hexdigest).to eq("0000239a")
    expect(s.reset.hexdigest).to eq("00000000")
  end

  it ".hexdigest" do
    expect(Digest::Prime31.hexdigest("abc" * 1000)).to eq("008b1190")
  end
end

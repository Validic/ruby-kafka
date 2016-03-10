describe Kafka::Protocol::Decoder do
  describe "#read" do
    it "reads the specified number of bytes" do
      data = "helloworld"
      decoder = Kafka::Protocol::Decoder.from_string(data)

      expect(decoder.read(5)).to eq "hello"
    end

    it "raises EOFError if there is no more data in the stream" do
      data = ""
      decoder = Kafka::Protocol::Decoder.from_string(data)

      expect { decoder.read(5) }.to raise_exception(EOFError)
    end

    it "raises EOFError if not all the data could be read" do
      data = "hell"
      decoder = Kafka::Protocol::Decoder.from_string(data)

      expect { decoder.read(5) }.to raise_exception(EOFError)
    end
  end
end
require 'spec_helper'

describe PromocodeGenerator do
  describe ".generate" do
    it "generates a code of the given length" do
      expect(PromocodeGenerator.generate(10).length).to eq(10)
    end

    it "generates a code with default length" do
      expect(PromocodeGenerator.generate.length).to be > 0
    end
  end
end

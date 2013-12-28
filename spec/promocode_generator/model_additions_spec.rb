require 'spec_helper'

# Dummy reject condition that can be stubbed in the tests below
module RejectCondition
  def self.check(code)
    false 
  end
end

class Campaign < SuperModel::Base
  include ActiveModel::Validations::Callbacks
  extend PromocodeGenerator::ModelAdditions
  promocode_attribute :code, :reject_if => Proc.new { |code| RejectCondition.check(code) }
end

describe PromocodeGenerator::ModelAdditions do
  let(:campaign) { Campaign.new(:name => "foo") }

  context "when the model is saved" do
    it "generates a code" do
      expect(PromocodeGenerator).to receive(:generate).once.and_return('ABCDEFG')
      campaign.save!
    end

    it "assigns the code to the model" do
      campaign.save!
      expect(campaign.code).not_to be_nil
    end
  end

  context "when the reject_if block returns false" do
    before { RejectCondition.stub(:check).and_return(true, false) }
    after { RejectCondition.unstub(:check) }

    it "generates a new code" do
      expect(PromocodeGenerator).to receive(:generate).exactly(2).times
      campaign.save!
    end
  end
end

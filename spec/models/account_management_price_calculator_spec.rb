require "rails_helper"

describe AccountManagementPriceCalculator, type: :model do

  describe "#price" do
    it "calculates correctly" do
      calc = AccountManagementPriceCalculator.new(hours: 1.to_d)

      expect(calc.price).to eq(65)
    end
    
    it "calculates correctly with decimal hours" do
      calc = AccountManagementPriceCalculator.new(hours: 5.58.to_d)

      expect(calc.price).to eq(362.70)
    end
  end
end
require 'rails_helper'

describe Product do

  it "has a valid factory" do
    FactoryGirl.create(:product).should be_valid
  end
  it "is invalid without name" do
    FactoryGirl.build(:product, name: nil).should_not be_valid
  end

  it "is invalid without manufacture" do
    FactoryGirl.build(:product, manufacture_id: nil).should_not be_valid
  end
  # it "has image of product"

  # it "check if sku is unique" do
  #   FactoryGirl.create(:product, sku: 10005)
  #   FactoryGirl.build(:product, sku: 10005).should_not be_valid
  # end
  # it "has manufacture" do
  #   FactoryGirl.create(:product, manufacture_id: 1)
  # end

  # it "should have color set" do
  #   FactoryGirl.build(:product, color: "grey")
  # end
  # it "has description at least 10 words long "

end
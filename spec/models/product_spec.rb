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

end
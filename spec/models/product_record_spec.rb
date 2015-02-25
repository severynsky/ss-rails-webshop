require 'rails_helper'

describe ProductRecord do
  before do
    @prod_rec = FactoryGirl.build(:product_record)
  end
  it "has quantity method" do
    binding.pry
    @prod_rec.quantity_price == 177.97
  end
end
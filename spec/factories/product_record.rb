FactoryGirl.define do
  factory :product_record do
    quantity 3
    association :product
  end
end
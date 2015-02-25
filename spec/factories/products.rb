require 'faker'

FactoryGirl.define do
  factory :product do
    name "Test gadget"
    price 59.99
    sku {Faker::Number.number(6)}
    description {Faker::Lorem.paragraph}
    color {Faker::Commerce.color}
    manufacture_id {Faker::Number.number(1)}
  end
end
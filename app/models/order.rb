class Order < ActiveRecord::Base
  has_many :product_records
  belongs_to :user
end
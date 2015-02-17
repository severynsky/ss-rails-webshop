class Order < ActiveRecord::Base
  has_one :cart
  belongs_to :users
end

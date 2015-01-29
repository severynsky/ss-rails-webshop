class Product < ActiveRecord::Base
  validates :name, :image, :color, :description, :sku, :manufacture, presence: true
end

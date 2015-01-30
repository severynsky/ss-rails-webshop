class Product < ActiveRecord::Base

  belongs_to :category

  validates :name, :image, :color, :description, :sku, :manufacture, presence: true
end

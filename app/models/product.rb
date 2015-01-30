class Product < ActiveRecord::Base

  belongs_to :category
  belongs_to :manufacture

  validates :name, :image, :color, :description, :category_id, :sku, :manufacture_id, presence: true
end

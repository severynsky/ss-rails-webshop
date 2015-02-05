class Product < ActiveRecord::Base
  has_many :product_records
  belongs_to :category
  belongs_to :manufacture

  validates :name, :image, :color, :description, :category_id, :sku, :manufacture_id, presence: true
end

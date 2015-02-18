class ProductRecord < ActiveRecord::Base
  belongs_to :product
  belongs_to :carts

  def quantity_price
    quantity * product.price
  end
end

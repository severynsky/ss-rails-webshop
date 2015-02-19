class ProductRecord < ActiveRecord::Base
  belongs_to :product


  def quantity_price
    quantity * product.price
  end
end

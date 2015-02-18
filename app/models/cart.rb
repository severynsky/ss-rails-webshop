class Cart < ActiveRecord::Base
  has_many :product_records, dependent: :destroy
  belongs_to :order


end

class Product < ActiveRecord::Base
  before_destroy :check_product_exist_in_product_record

  has_many :product_records, dependent: :destroy
  belongs_to :category
  belongs_to :manufacture
  has_many :pictures, as: :imageable

  accepts_nested_attributes_for :pictures

  protected
  def check_product_exist_in_product_record
    product_records.empty?
  end

end

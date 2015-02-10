class Product < ActiveRecord::Base
  before_destroy :check_product_exist_in_product_record

  has_many :product_records, dependent: :destroy
  belongs_to :category
  belongs_to :manufacture

  validates :name, :image, :color, :description, :category_id, :sku, :manufacture_id, presence: true

  protected
  def check_product_exist_in_product_record
    # binding.pry
    product_records.empty?
  end

end

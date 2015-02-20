class Product < ActiveRecord::Base
  before_destroy :check_product_exist_in_product_record

  has_many :product_records
  belongs_to :category
  belongs_to :manufacture
  has_many :pictures, as: :imageable

  validates :name, presence: true,
      uniqueness: true,
      length: {minimum: 4}
  validates :sku, presence: true,
        uniqueness: true,
      length: {minimum: 5}
  validates :price, numericality: true
  validates :color, presence: true
  validates :description, presence: true,
      length: {minimum: 10}
  # validates :pictures, presence: true

  accepts_nested_attributes_for :pictures, :reject_if => lambda { |t| t['image'].blank? }

  protected
  def check_product_exist_in_product_record
    product_records.empty?
  end

end

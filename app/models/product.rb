class Product < ActiveRecord::Base
  before_destroy :check_product_exist_in_product_record

  has_many :product_records, dependent: :destroy
  belongs_to :category
  belongs_to :manufacture
  has_many :pictures, as: :imageable

  # validates :pictures, presence: true

  accepts_nested_attributes_for :pictures, :reject_if => lambda { |t| t['image'].blank? }

  protected
  def check_product_exist_in_product_record
    product_records.empty?
  end

end

class Manufacture < ActiveRecord::Base

  has_many :products

  validates :title, presence: true
end

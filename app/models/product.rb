class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  
  validates :product_id, presence: true
  validates :product_name, presence: true
  validates :discontinued, presence: true
  validates_with CategoryValidator
  validates :product_name, length: { in: 6..20 }
end

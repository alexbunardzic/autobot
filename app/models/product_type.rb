class ProductType < ActiveRecord::Base
  has_many :products
  
  validates :name, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }

end

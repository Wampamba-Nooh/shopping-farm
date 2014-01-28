class Product < ActiveRecord::Base
  has_many :product_pictures, :dependent => :destroy
  belongs_to :brand
  
  accepts_nested_attributes_for :brand

end

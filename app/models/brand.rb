class Brand < ActiveRecord::Base
  has_many :brand_pictures, :dependent => :destroy
  has_many :products
  
  translates :short_description, :full_description, :title
  has_and_belongs_to_many :categories
end

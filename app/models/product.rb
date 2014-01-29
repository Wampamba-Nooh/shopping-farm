class Product < ActiveRecord::Base
  has_many :product_pictures, :dependent => :destroy
  
  has_and_belongs_to_many :categories
  
  belongs_to :brand
  
  accepts_nested_attributes_for :brand
  translates :short_description, :full_description, :title
end

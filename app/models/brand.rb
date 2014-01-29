class Brand < ActiveRecord::Base
  has_many :brand_pictures, :dependent => :destroy
  has_many :products, :dependent => :destroy
  has_many :customer_proposals
  translates :short_description, :full_description, :title

end

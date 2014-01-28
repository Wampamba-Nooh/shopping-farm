class Brand < ActiveRecord::Base
  has_many :products, :dependent => :destroy
  has_many :customer_proposals
end

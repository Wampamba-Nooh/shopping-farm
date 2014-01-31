class Manufacturer < ActiveRecord::Base
  has_many :manufacturer_pictures, :dependent => :destroy
  translates :short_description, :full_description, :title
  has_and_belongs_to_many :categories
end

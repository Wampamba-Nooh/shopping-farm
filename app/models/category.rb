class Category < ActiveRecord::Base
  has_many :category_pictures, :dependent => :destroy
  has_many :children, class_name: "Category", foreign_key: "parent_id", dependent: :destroy

  belongs_to :parent, class_name: "Category"
  has_and_belongs_to_many :brands
  has_and_belongs_to_many :products
  has_and_belongs_to_many :manufacturers
  translates :title
  
  def is_part_of(category)
    #return true if category == self
    #return parent.is_part_of(category) unless parent.nil?
    #return false
  end

  scope :root, lambda {
    where("parent_id is null")
  }
end


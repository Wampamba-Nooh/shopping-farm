class Category < ActiveRecord::Base
  has_many :children, class_name: "Category", foreign_key: "parent_id", dependent: :destroy

  belongs_to :parent, class_name: "Category"

  def is_part_of(category)
    #return true if category == self
    #return parent.is_part_of(category) unless parent.nil?
    #return false
  end

end

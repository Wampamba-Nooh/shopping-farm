class Page < ActiveRecord::Base
  translates :short_content, :full_content, :title
  has_and_belongs_to_many :categories
end

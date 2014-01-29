class Page < ActiveRecord::Base
  translates :short_content, :full_content, :title
end

class AdminProfile < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
end

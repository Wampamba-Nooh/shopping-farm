class DealerProfile < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  
  translates :contacts, :person_contacts
end

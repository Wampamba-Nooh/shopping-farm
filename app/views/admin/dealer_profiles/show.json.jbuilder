json.extract! @dealer_profile, :id, :identificator, :created_at, :city, :status, :contacts,  :person_contacts, :email, :phone_number

json.created_at @dealer_profile.created_at.to_date
json.updated_at @dealer_profile.updated_at.to_date



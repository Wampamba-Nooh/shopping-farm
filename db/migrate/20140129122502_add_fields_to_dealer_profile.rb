class AddFieldsToDealerProfile < ActiveRecord::Migration
  def change
    add_column :dealer_profiles, :city_latitude, :float
    add_column :dealer_profiles, :city_longitude, :float

    add_column :dealer_profiles, :identificator, :string, null: false
    add_column :dealer_profiles, :status, :string, null: false
    add_column :dealer_profiles, :city, :string, null: false
    #add_column :dealer_profiles, :contacts, :text, null: false
    #add_column :dealer_profiles, :person_contacts, :text, null: false
    
    add_column :dealer_profiles, :phone_number, :string, null: false
    add_column :dealer_profiles, :email, :string, null: false
  end
end

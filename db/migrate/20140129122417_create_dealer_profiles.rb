class CreateDealerProfiles < ActiveRecord::Migration
  def change
    create_table :dealer_profiles do |t|
      t.integer :user_id
      
      t.timestamps
    end
  end
end

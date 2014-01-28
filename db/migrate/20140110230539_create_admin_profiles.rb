class CreateAdminProfiles < ActiveRecord::Migration
  def change
    create_table :admin_profiles do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end

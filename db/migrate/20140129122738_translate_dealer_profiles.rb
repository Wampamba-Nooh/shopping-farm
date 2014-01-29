class TranslateDealerProfiles < ActiveRecord::Migration
  def self.up
    DealerProfile.create_translation_table!({
      :contacts => :text,
      :person_contacts => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    DealerProfile.drop_translation_table! :migrate_data => true
  end
end

    
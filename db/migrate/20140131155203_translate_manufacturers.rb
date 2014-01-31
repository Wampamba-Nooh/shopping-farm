class TranslateManufacturers < ActiveRecord::Migration
  def self.up
    Manufacturer.create_translation_table!({
      :short_description => :text, 
      :full_description => :text,
      :title => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Manufacturer.drop_translation_table! :migrate_data => true
  end
end

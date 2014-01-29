class TranslateBrands < ActiveRecord::Migration
  def self.up
    Brand.create_translation_table!({
      :short_description => :text, 
      :full_description => :text,
      :title => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Brand.drop_translation_table! :migrate_data => true
  end
end

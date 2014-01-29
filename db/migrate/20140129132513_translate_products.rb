class TranslateProducts < ActiveRecord::Migration
  def self.up
    Product.create_translation_table!({
      :short_description => :text, 
      :full_description => :text,
      :title => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Product.drop_translation_table! :migrate_data => true
  end
end

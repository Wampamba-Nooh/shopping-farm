class TranslatePages < ActiveRecord::Migration
  def self.up
    Page.create_translation_table!({
      :short_content => :text, 
      :full_content => :text,
      :title => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Page.drop_translation_table! :migrate_data => true
  end
end

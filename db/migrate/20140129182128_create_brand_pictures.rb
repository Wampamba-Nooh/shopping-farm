class CreateBrandPictures < ActiveRecord::Migration
  def change
    create_table :brand_pictures do |t|
      
      t.string :picture_file_name
      t.string :picture_content_type
      t.integer :picture_file_size
      t.datetime :picture_updated_at
      
      t.integer :brand_id, null: true, default: nil

      t.timestamps
    end
  end
end

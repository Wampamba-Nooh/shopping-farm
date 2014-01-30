class CreateCategoryPictures < ActiveRecord::Migration
  def change
    create_table :category_pictures do |t|
      t.string :picture_file_name
      t.string :picture_content_type
      t.integer :picture_file_size
      t.datetime :picture_updated_at
      
      t.integer :category_id, null: true, default: nil

      t.timestamps
    end
  end
end

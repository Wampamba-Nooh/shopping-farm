class CreateCategoriesPagesJoinTable < ActiveRecord::Migration
  def self.up
    create_table :categories_pages, :id => false do |t|
      t.integer :page_id
      t.integer :category_id
    end

    add_index :categories_pages, :page_id
    add_index :categories_pages, :category_id
  end

  def self.down
    drop_table :categories_pages
  end
end

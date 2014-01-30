class CreateBrandsCategoriesJoinTable < ActiveRecord::Migration
  def self.up
    create_table :brands_categories, :id => false do |t|
      t.integer :brand_id
      t.integer :category_id
    end

    add_index :brands_categories, :brand_id
    add_index :brands_categories, :category_id
  end

  def self.down
    drop_table :brands_categories
  end
end

class CreateCategoriesManufacturersJoinTable < ActiveRecord::Migration
  def self.up
    create_table :categories_manufacturers, :id => false do |t|
      t.integer :manufacturer_id
      t.integer :category_id
    end

    add_index :categories_manufacturers, :manufacturer_id
    add_index :categories_manufacturers, :category_id
  end

  def self.down
    drop_table :categories_manufacturers
  end
end

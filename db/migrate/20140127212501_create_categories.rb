class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :identificator, null: false
      t.integer :parent_id, null: true, default: nil

      t.timestamps
    end
  end
end

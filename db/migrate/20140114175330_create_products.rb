class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      
      t.string :brand_id, null: false
      t.string :product_name, null: false

      t.timestamps
    end
  end
end

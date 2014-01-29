class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :identificator, null: false

      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.string :manufacture
      t.string :color
      t.float :price
      t.integer :sku
      t.text :description

      t.timestamps null: false
    end
  end
end

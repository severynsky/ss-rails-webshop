class CreateProductRecords < ActiveRecord::Migration
  def change
    create_table :product_records do |t|
      t.integer :order_id

      t.timestamps null: false
    end
  end
end

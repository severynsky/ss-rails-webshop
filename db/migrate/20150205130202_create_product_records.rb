class CreateProductRecords < ActiveRecord::Migration
  def change
    create_table :product_records do |t|

      t.timestamps null: false
    end
  end
end

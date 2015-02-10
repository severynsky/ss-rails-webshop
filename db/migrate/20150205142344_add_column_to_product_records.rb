class AddColumnToProductRecords < ActiveRecord::Migration
  def change
    add_column :product_records, :product_id, :integer
    add_column :product_records, :cart_id, :integer
  end
end

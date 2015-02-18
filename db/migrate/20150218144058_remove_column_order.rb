class RemoveColumnOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :product_record_id
    add_column :product_records, :order_id, :integer
  end
end

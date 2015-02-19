class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :orders, :cart_id
    add_column :orders, :product_record_id, :integer
  end
end

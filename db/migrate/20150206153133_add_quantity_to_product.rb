class AddQuantityToProduct < ActiveRecord::Migration
  def change
    add_column :product_records, :quantity, :integer
  end
end

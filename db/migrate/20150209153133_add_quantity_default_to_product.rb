class AddQuantityDefaultToProduct < ActiveRecord::Migration
  def change
    change_column :product_records, :quantity, :integer, :default => 0
  end
end
ß
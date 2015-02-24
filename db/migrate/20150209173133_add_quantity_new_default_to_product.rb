class AddQuantityNewDefaultToProduct < ActiveRecord::Migration
  def change
    change_column :product_records, :quantity, :integer, :default => 1
  end
end

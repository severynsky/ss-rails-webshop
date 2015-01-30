class ChangeProductColumnType < ActiveRecord::Migration
  def up
    change_column :products, :manufacture, :integer
    rename_column :products, :manufacture, :manufacture_id
  end

  def down
  end
end

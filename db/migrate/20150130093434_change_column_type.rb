class ChangeColumnType < ActiveRecord::Migration
  def up
    change_column :products, :category, :integer
  end

  def down
  end
end

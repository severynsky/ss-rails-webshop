class ChangeColumnName < ActiveRecord::Migration
  def up
    rename_column :products, :category, :category_id
  end

  def down

  end
end

class ChangeModelName < ActiveRecord::Migration
  def change
    rename_table :orders, :orders
  end
end

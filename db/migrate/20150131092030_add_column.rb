class AddColumn < ActiveRecord::Migration
  def change
    add_column :manufactures, :description, :text
  end
end

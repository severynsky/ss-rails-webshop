class AddColumnToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :name, :string
    add_column :pictures, :imageable_id, :integer
    add_column :pictures, :imageable_type, :string

  end
end

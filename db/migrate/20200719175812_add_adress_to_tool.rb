class AddAdressToTool < ActiveRecord::Migration[6.0]
  def change
    add_column :tools, :adress, :string
  end
end

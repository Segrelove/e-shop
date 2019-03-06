class AddColumnToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :current, :boolean
    remove_column :carts, :status
  end
end

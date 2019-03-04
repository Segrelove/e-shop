class RemoveAttributFrom < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :admin_id
  end
end

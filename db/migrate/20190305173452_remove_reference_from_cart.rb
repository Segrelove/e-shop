class RemoveReferenceFromCart < ActiveRecord::Migration[5.2]
  def change
  	remove_column :carts, :tenant_id
  	add_reference :carts, :user, index: true
  end
end

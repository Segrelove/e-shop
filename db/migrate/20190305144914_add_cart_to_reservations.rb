class AddCartToReservations < ActiveRecord::Migration[5.2]
  def change

    remove_column :reservations, :tenant_id
  end
end

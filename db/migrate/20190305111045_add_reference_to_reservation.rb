class AddReferenceToReservation < ActiveRecord::Migration[5.2]
  def change
    add_reference :reservations, :cart, index: true
    remove_column :reservations, :status
  end
end

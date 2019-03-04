class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :status
      t.belongs_to :property, index: true
      t.references :tenant, index: true
      t.timestamps
    end
  end
end

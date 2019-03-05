class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :property, index: true
      t.references :tenant, index: true
      t.timestamps
    end
  end
end

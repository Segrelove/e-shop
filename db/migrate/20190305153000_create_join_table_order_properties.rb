class CreateJoinTableOrderProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_order_properties do |t|
      t.belongs_to :order, index: true
      t.belongs_to :property, index: true
      t.timestamps
    end
  end
end

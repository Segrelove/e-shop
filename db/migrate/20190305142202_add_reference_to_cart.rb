class AddReferenceToCart < ActiveRecord::Migration[5.2]
  def change
    add_reference :carts, :tenant
  end
end

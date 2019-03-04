class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :title
      t.decimal :price
      t.integer :surface
      t.string :description
      t.string :image_url
      t.references :agent, index: true
      t.timestamps
    end
  end
end

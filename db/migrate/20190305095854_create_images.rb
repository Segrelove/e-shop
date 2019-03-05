class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.belongs_to :property, index: true
      t.text :description
      t.string :url
      t.timestamps
    end
  end
end

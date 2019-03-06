class Property < ApplicationRecord
  has_many :reservations
  has_many :carts, through: :reservations
  has_many :join_table_order_properties
  has_many :orders, through: :join_table_order_properties
  has_many :tenants, through: :orders
  has_many :images
  belongs_to :agent, class_name: "User"

  validates :title, presence: true, length: { in: 3 ..140 }, :message =>"Le titre n'est pas valide, rentrez entre 3 et 140 caractères"
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 10000 }
  validates :surface, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 1000 }

end

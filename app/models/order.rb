class Order < ApplicationRecord
  has_many :join_table_order_properties
  has_many :properties, through: :join_table_order_properties

  belongs_to :tenant, class_name: "User"

end

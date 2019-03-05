class Reservation < ApplicationRecord
  belongs_to :tenant, class_name: "User"
  belongs_to :property

  validates :tenant_id, presence: true
  validates :property_id, presence: true
  validates :status, presence: true

end

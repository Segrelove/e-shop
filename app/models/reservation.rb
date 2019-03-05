class Reservation < ApplicationRecord
  belongs_to :property
  belongs_to :cart

  validates :property_id, presence: true

end

class Reservation < ApplicationRecord
  belongs_to :property
  belongs_to :cart

  validates :property_id,
  presence: true
  #Decided to comment out this validator because we are not sur what it really does
  # uniqueness: {message:"Cette propriété est déjà dans votre panier!"}

end

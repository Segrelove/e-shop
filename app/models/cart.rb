class Cart < ApplicationRecord
  has_many :reservations
  has_many :properties, through: :reservations
  belongs_to :user


  def total_price
    total_price = 0
      self.reservations.each do |reservation|
        total_price += reservation.property.price
      end
    return total_price
  end

end

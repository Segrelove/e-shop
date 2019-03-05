class Cart < ApplicationRecord
  has_many :reservations
  has_many :properties, through: :reservations
  belongs_to :user
end

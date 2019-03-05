class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :reservations, foreign_key: "tenant_id", class_name: "Reservation"
  has_many :interested_properties, foreign_key: 'tenant_id', class_name: 'Property', through: :reservations
  has_many :managed_properties, foreign_key: 'agent_id', class_name: 'Property'


    validates :first_name, presence: true, length: { in: 2..30 }
    validates :last_name, presence: true, length: { in: 2..30 }
    validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
    validates :encrypted_password, presence: true, length: { minimum: 6 }
end

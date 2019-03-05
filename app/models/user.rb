class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable



  has_many :managed_properties, foreign_key: 'agent_id', class_name: 'Property'
  has_one :cart, foreign_key:'tenant_id', class_name: 'Cart'
  has_many :orders, foreign_key: 'tenant_id', class_name: 'Cart'
  has_many :visited_properties, foreign_key: 'tenant_id', class_name: 'Property', through: :orders

    validates :first_name, presence: true, length: { in: 2..30 }
    validates :last_name, presence: true, length: { in: 2..30 }
    validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
    validates :encrypted_password, presence: true, length: { minimum: 6 }
end

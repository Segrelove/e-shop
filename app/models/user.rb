class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  after_create :cart_creation



  has_many :managed_properties, foreign_key: 'agent_id', class_name: 'Property'
  has_many :carts, foreign_key:'user_id'
  has_many :orders, foreign_key: 'tenant_id', class_name: 'Order'
  # has_many :visited_properties, foreign_key: 'tenant_id', class_name: 'Property', through: :orders

  validates :email,
  presence: {message: "Saisissez l'email"} ,
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "L'email n'est pas au bon format"}
  validates :encrypted_password,
  presence: {message: "Saisissez votre mot de passe"},
  length: {minimum: 6, message: "Le mot de passe doit contenir au minimum 6 caractères"}




  def cart_creation
    cart = Cart.create(user: self, current: true)
  end

  def current_cart
    return Cart.where(user: self, current: true)
  end
end

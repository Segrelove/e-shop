class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  after_create :cart_creation



  has_many :properties, foreign_key: 'agent_id', class_name: 'Property'
  has_many :carts, foreign_key:'user_id' 
  has_many :orders, foreign_key: 'tenant_id', class_name: 'Order' 
  #has_many :visited_properties, foreign_key: 'tenant_id', class_name: 'Property', through: :orders 

    #validates :first_name, presence: true, length: { in: 2..30 }
    #validates :last_name, presence: true, length: { in: 2..30 }
    validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
    validates :encrypted_password, presence: true, length: { minimum: 6 }




private

  def cart_creation
      cart = Cart.create(user: self, current: true)
  end


end

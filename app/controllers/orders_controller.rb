class OrdersController < ApplicationController
  before_action :authenticate_user!
  # before_action :authenticate_user_id, except: [:show]


  def index
    @orders = Order.where(tenant: current_user)
    puts '*' * 60
    puts @test
    current_cart
  end

  def show 
  end

  def new
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })

  @order = Order.new(tenant: current_user, stripe_customer_id: customer.id)
  #TODO A AMELIORER AVEC CURRENTCART
  @cart = Cart.last


  if charge.save
    @order.save
    @cart.reservations.each do |reservation|
      @jointabledata = JoinTableOrderProperty.create(property: reservation.property, order: @order)
     end
  else
    puts "#" * 60 
    puts "PAS HELLO"
  end
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_order_path
  end


  private

  # def authenticate_user_id
  #   unless current_user.id == params[:id].to_i
  #     puts "t'es niqué"
  #     redirect_to root_path
  #   end
  # end

  def current_cart
    if current_user.carts.count == 1
      puts current_user.carts.last.current == true
    else
      puts error 
    end
  end

  def change_cart_status
    @cart = Cart.find
  end

end


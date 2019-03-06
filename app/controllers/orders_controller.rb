class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_user_id, except: [:show]


  def index
    @orders = Order.where(tenant: current_user)
  end

  def show 

  end

  def new

  end

  def create
    # Amount in cents
    @amount = Cart.total_price

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

  def authenticate_user_id
    unless current_user.id == params[:id]
      redirect_to root_path
    end
  end
end


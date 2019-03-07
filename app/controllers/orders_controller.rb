class OrdersController < ApplicationController
  before_action :authenticate_user!
  # before_action :authenticate_user_id, except: [:show]

  def index
    @orders = Order.where(tenant: current_user)
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
  @cart = Cart.last


  if charge.save
    @order.save
    @cart.reservations.each do |reservation|
      @jointabledata = JoinTableOrderProperty.create(property: reservation.property, order: @order)
     end
     change_cart_status
     order_send (@order)
  end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_order_path
  end



  private    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @userivate
  # on envoie un mail à la création du order
    def order_send(order)
      OrderMailer.order_email_tenant(@order,@order.tenant).deliver_now
      OrderMailer.order_email_agent(@order.properties,@order.tenant).deliver_now
    end

  def authenticate_user_id
    unless current_user.id == params[:id].to_i
      redirect_to root_path
    end
  end

  def change_cart_status
    unless current_user.carts.last.current == false
      u = current_user.carts.last
      u.update(current: false)
      u2 = Cart.new(current: true, user: current_user)
      u2.save
    end
  end
end

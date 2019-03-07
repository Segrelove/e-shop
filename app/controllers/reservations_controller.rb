class ReservationsController < ApplicationController
  def index
  end

  def new
    @property=Property.find(params[:property_id])
  end

  def show

  end

  def destroy
    @reservation = Reservation.find(params[:id])


    if @reservation.destroy
      flash[:success] = "Ta réservation a bien été supprimée"
      redirect_to cart_path(@reservation.cart) 
    else
      flash[:danger] = @reservation.errors.full_messages
      redirect_to cart_path(@reservation.cart)
    end
  end

  def edit
  end

  def create

    @property=Property.find(params[:property_id])

    @reservation=Reservation.new(property: @property, cart: current_user.current_cart)
    if @reservation.save
      flash[:success] = "Ton élément a bien été ajouté au panier"
      redirect_to root_path
    else
      puts @reservation.errors.full_messages
      flash[:danger] = @reservation.errors.full_messages
      redirect_to property_path(@property)
    end

  end

  def show

  end
end

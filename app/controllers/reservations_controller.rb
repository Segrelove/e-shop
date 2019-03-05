class ReservationsController < ApplicationController
  def index
  end

  def new
    @property=Property.find(params[:property_id])
  end

  def show

  end

  def destroy

  end

  def edit
  end

  def create
    #TODO- A AMELIORER
    @property=Property.find(params[:property_id])

    @reservation=Reservation.new(property_id: @property.id, cart_id: Cart.last.id)
    if @reservation.save
      flash[:success] = "Ton element a bien été ajouté au panier"
      redirect_to root_path
    else
      flash[:danger] = "Une erreur s'est produite"
      redirect_to root_path
    end

  end

  def show

  end
end

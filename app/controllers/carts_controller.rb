class CartsController < ApplicationController
  def show
  	@cart = Cart.find(params[:id])
  	@reservations = @cart.reservations
  end
end

class CartsController < ApplicationController

  def show
  	@cart = Cart.find(params[:id])
  	@reservations = @cart.reservations
  	@total_price = total_price(@reservations)
  end



private

	def total_price(reservations)
		total_price = 0
		reservations.each do |reservation|
			total_price += reservation.property.price
			puts total_price
		end
		return total_price
	end

end

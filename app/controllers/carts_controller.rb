class CartsController < ApplicationController


  before_action :authenticate_user_id

  def show
    @cart = Cart.find(params[:id])
    @reservations = @cart.reservations
    @total_price = @cart.total_price
    puts @total_price
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

  def authenticate_user_id
    unless current_user.id == params[:id].to_i
      redirect_to root_path
    end

  end

end

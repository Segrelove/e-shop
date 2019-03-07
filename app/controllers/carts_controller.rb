class CartsController < ApplicationController
  # before_action :is_cart_already_paid, only: [:show]
#  before_action :authenticate_user_id

  def show
    @cart = Cart.find_by(user: current_user)
    @reservations = @cart.reservations
    @total_price = @cart.total_price
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

  # def is_cart_already_paid
  #   puts params
  #   puts "1"
  #   puts params[:id]
  #   puts "2"
  #   puts params[:id].to_i
  #   puts "3"
  #   puts current_user.current_cart.id
  #   if current_user.current_cart.id != params[:format].to_i
  #           puts "je suis là "*60
  #     redirect_to root_path
  #   end
  # end
end

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_user_id, except: [:show]




  def authenticate_user_id
    unless current_user.id == params[:id]
      redirect_to root_path
    end
  end
end

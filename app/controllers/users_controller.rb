class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_user_id


  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.update
      flash[:success] = "Informations correctement modifiées"
      redirect_to root_path
    else
      flash[:error] = "Erreur, veuillez réessayer"
    end
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

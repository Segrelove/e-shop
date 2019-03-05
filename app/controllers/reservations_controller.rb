class ReservationsController < ApplicationController
  def index
  end

  def new
    puts "%" * 100
    puts "%" * 100
    puts "%" * 100
    puts "%" * 100
  end

  def show

  end

  def destroy

  end

  def edit
  end

  def create
    puts "$" * 100
    puts "$" * 100
    puts "$" * 100
    puts "$" * 100
    @reservation = Reservation.new(property_id: params[:property_id], cart_id: 1)
    if @reservation.save 
      flash[:success] = "Element bien ajouté au pannier !"
      puts "60" * 60
      redirect_to root_path
    else
      flash[:error] = "Une erreur s'est produite"
      render :show 
    end
  end

  def show

  end
end

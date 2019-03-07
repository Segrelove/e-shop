class PropertiesController < ApplicationController

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def show
    @property = Property.find(params[:id])
  end

  def destroy

  end

  def edit
  end

  def create
    @property = Property.new params.require(:property).permit(:title, :price, :surface, :description)
    @property.image.attach(params[:property][:images])
    @property.agent_id = 1

    if @property.save
      flash[:success] = "Votre bien a été créé"
      redirect_to root_path
    else
    flash[:danger] = @property.errors.messages
    redirect_to new_property_path
    end

  end


end

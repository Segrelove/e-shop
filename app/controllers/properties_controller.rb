class PropertiesController < ApplicationController

  def index
    @properties = Property.all
  end

  def new

  end

  def show
    @property = Property.find(params[:id])
  end

  def destroy

  end

  def edit
  end

  def create

  end
end

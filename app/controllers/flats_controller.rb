class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render 'new'
    end
  end

  def update
    @flat = Flat.find(params[:id])
    respond_to do
      if @flat.update flat_params
      end
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price, :photo)
  end
end

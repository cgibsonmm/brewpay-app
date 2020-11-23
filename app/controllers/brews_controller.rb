class BrewsController < ApplicationController
  before_action :authenticate_brewery!

  def index
    @brewery = Brewery.find(params[:brewery_id])
    @brews = @brewery.brews
  end

  def new
    @brew = Brew.new
  end

  def create
    @brew = current_brewery.brews.build(create_params)

    if @brew.save
      redirect_to brewery_brews_path(current_brewery)
      flash[:success] = 'Successfully created brew'
    else
      render new
      flash[:error] = 'Error creating brew'
    end
  end

  private

  def create_params
    params.require(:brew).permit(:title, :description, :price, :ABV, :logo)
  end
end

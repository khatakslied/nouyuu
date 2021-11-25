class GardensController < ApplicationController
  def index
    @gardens = policy_scope(Garden).order(created_at: :desc)
  end

  def show
    @garden = Garden.find(params[:id])
    @tiles = @garden.tiles
    authorize @garden
    @plot = Plot.new
    @favorites = current_user.favorited_by_type('Crop')
  end

  def new
    @garden = Garden.new
    authorize @garden
  end

  def create
    @garden = Garden.new(garden_params)
    authorize @garden
    @garden.user = current_user
    # @garden.location = "Meguro"
    if @garden.save!
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  private

  def garden_params
    params.require(:garden).permit(:location, :height, :width)
  end
end

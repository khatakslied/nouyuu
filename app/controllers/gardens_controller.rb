class GardensController < ApplicationController
  def index
    @gardens = policy_scope(Garden).order(created_at: :desc)
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
      redirect_to gardens_path
    else
      render :new
    end
  end

  private

  def garden_params
    params.require(:garden).permit(:height, :width)
  end
end

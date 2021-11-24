class PlotsController < ApplicationController
  def new
    @garden = Garden.find(params[:garden_id])
    @plot = Plot.new
    @tiles = Tile.all
    @crops = Crop.all
    authorize @plot
  end

  def create
    @plot = Plot.new(plot_params)
    @plot.garden_id = params[:garden_id]
    # harcoded crop, needs the favorites crops here
    @plot.crop_id = 1
    @garden = Garden.find(params[:garden_id])
    @plot.name = params[:plot][:name]
    @tiles = params[:plot][:tiles]
    @tile_ids = @tiles.split(',').map!(&:to_i)
    authorize @plot
    if @plot.save
      give_plot_id_to_tiles(@tile_ids, @plot)
      redirect_to garden_path(@garden)
    else
      # not sure where to lead if it doesn't work
      raise StandardError::NotAuthorized
    end
  end

  private

  def plot_params
    params.require(:plot).permit(:garden_id, :crop_id, plot: [:name, :tiles])
  end

  def give_plot_id_to_tiles(tile_ids, plot)
    @plot_id = plot.id
    tile_ids.each do |tile_id|
      target_tile = Tile.find(tile_id)
      target_tile.plot_id = @plot_id
      target_tile.save
    end
  end
end

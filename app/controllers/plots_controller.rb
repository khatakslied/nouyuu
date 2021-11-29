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
    @plot.crop_id = params[:plot][:crop]
    @plot.days_since_watering = 0
    @garden = Garden.find(params[:garden_id])
    @plot.name = params[:plot][:name]
    @tiles = params[:plot][:tiles]
    @tile_ids = @tiles.split(',').map!(&:to_i)
    authorize @plot
    # method to get the prefecture out of the garden
    @hardiness_zone = prefecture_hardiness(@garden)
    raise
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
    params.require(:plot).permit(:garden_id, :crop_id, plot: [:name, :tiles, :crop])
  end

  def give_plot_id_to_tiles(tile_ids, plot)
    @plot_id = plot.id
    tile_ids.each do |tile_id|
      target_tile = Tile.find(tile_id)
      target_tile.plot_id = @plot_id
      target_tile.save
    end
  end

  def prefecture_hardiness(garden)
    garden_prefecture = garden.location.split(',')[1].strip
    serialized_prefectures = File.read("db/prefectures_hardiness_zones.json")
    prefectures_list = JSON.parse(serialized_prefectures)
    prefectures_list["prefectures"].each do |prefecture|
      if prefecture["name"] == garden_prefecture
        prefecture["hardiness_zone"]
      end
    end
  end
end

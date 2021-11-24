class PlotsController < ApplicationController
  def new
    @garden = Garden.find(params[:garden_id])
    @plot = Plot.new
    @tiles = Tile.all
    @crops = Crop.all
    # on click save the id of the clicked tiles
    # use stimulus, on click
    # https://github.com/jonhue/acts_as_favoritor to get the tiles id
    # on click toggle the "active class" and grab everything from there?
    # once selected ...something pops to make the user select, the #new
    # of the plot starts when you start selecting the vegetables
    # the new is the simple form that has the information of the crops
    authorize @plot
  end

  def create
    # after create? @tiles = params[:tiles]
    @plot = Plot.new(plot_params)
    @plot.garden_id = params[:garden_id]
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

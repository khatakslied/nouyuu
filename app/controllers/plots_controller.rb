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
    # @tiles = all the tiles that match the ids on the array
  end

  private

  def plot_params
  end
end

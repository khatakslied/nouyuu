require 'uri'
require 'net/http'

class GardensController < ApplicationController
  def index
    @gardens = policy_scope(Garden).order(created_at: :desc)
  end

  def show
    @garden = Garden.find(params[:id])
    weather_call(@garden)
    @tiles = @garden.tiles.order(id: :asc)
    authorize @garden
    @plot = Plot.new
    @favorites = current_user.favorited_by_type('Crop')
    @tile = Tile.find(params[:tile_id]) if params[:tile_id]
  end

  def new
    @garden = Garden.new
    authorize @garden
  end

  def create
    @garden = Garden.new(garden_params)
    authorize @garden
    @garden.user = current_user
    @garden.location = params[:garden][:location].split(',')[0]
    if @garden.save!
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  private

  def weather_call(garden)
    uri = URI('https://api.openweathermap.org/data/2.5/weather')
    params = { units: 'metric', q: garden.location, appid: ENV['WEATHER_API'] }
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(uri)
    @weather_response = JSON.parse(response.body)
  end

  def garden_params
    params.require(:garden).permit(:location, :height, :width, :garden)
  end
end

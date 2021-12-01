require 'uri'
require 'net/http'

class GardensController < ApplicationController
  def index
    @gardens = policy_scope(Garden).order(created_at: :desc)
  end

  def show

    if params[:tile_id]
      garden = Garden.find(params[:id])
      authorize garden

      @tile = garden.tiles.find(params[:tile_id])
    else
      @garden = Garden.find(params[:id])
      weather_call(@garden)
      @tiles = @garden.tiles.order(id: :asc)
      authorize @garden
      @plot = Plot.new
      @favorites = current_user.favorited_by_type('Crop')

      ## Added filter for location & season to pass to the form
      @crops = Crop.all
      if @garden.location.split(',')[-1].strip.downcase == 'japan' && @garden.location.split(',').count == 3
        prefecture_hardiness(@garden)
        @sowable_crops = []
        @crops.each do |crop|
          @hardiness_zone.each do |zone|
            if (crop.min_hardiness_zone..crop.max_hardiness_zone).cover?(zone) && sowing_months?(crop) == true
              @sowable_crops << crop
            end
          end
        end
        @hardiness_recommendation = @sowable_crops.uniq
      else
        @hardiness_recommendation = @crops
      end
      ##
    end
  end

  def new
    @garden = Garden.new
    authorize @garden
  end

  def create
    @garden = Garden.new(garden_params)
    authorize @garden
    @garden.user = current_user
    if @garden.save!
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  private

  def weather_call(garden)
    uri = URI('https://api.openweathermap.org/data/2.5/weather')
    params = { units: 'metric', q: garden.location.split(',')[0], appid: ENV['WEATHER_API'] }
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(uri)
    @weather_response = JSON.parse(response.body)
  end

  def garden_params
    params.require(:garden).permit(:location, :height, :width, :garden)
  end

  ## Methods to get the hardiness zones and the sowing months
  def prefecture_hardiness(garden)
    garden_prefecture = garden.location.split(',')[1].strip
    serialized_prefectures = File.read("db/prefectures_hardiness_zones.json")
    prefectures_list = JSON.parse(serialized_prefectures)
    prefectures_list["prefectures"].each do |prefecture|
      @hardiness_zone = prefecture["hardiness_zone"] if prefecture["name"] == garden_prefecture
    end
  end

  def sowing_months?(crop)
    @date = Date.today
    @current_month = @date.strftime("%B")
    crop_months = crop.sowing_months.split(",")
    crop_months.each do |month|
      return true if month.strip == @current_month
    end
  end
  ##
end

require 'uri'
require 'net/http'

class CropsController < ApplicationController
  def index
    @crops = policy_scope(Crop).all

    if params[:query].present?
      search(params[:query])
    end

    respond_to do |format|
      format.html # default Rails behavior (render :index)
      format.text { render partial: 'cropes/crop', locals: { crops: @crops }, formats: [:html] }
    end
  end

  def show
    @crop = Crop.find(params[:id])
    authorize @crop
  end

  def toggle_favorite
    @crop = Crop.find_by(id: params[:id])
    authorize @crop
    current_user.favorited?(@crop) ? current_user.unfavorite(@crop) : current_user.favorite(@crop)
    redirect_to crops_path
  end

  def favorite
    @favorites = current_user.favorited_by_type('Crop')
    authorize @favorites
  end

  private

  def weather_call(location)
    uri = URI('https://api.openweathermap.org/data/2.5/weather')
    params = { units: 'metric', q: location, appid: ENV['WEATHER_API'] }
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)['main']['temp_min']
  end

  def search(season)
    case season
      when 'Autumn'
        @crops = Crop.where('sowing_months ILIKE :query', query: "%September, October, November%" )
      when 'Winter'
        @crops = Crop.where('sowing_months ILIKE :query', query: "%December, January, February%" )
      when 'Spring'
        @crops = Crop.where('sowing_months ILIKE :query', query: "%March, April, May%")
      when 'Summer'
        @crops = Crop.where('sowing_months ILIKE :query', query: "%June, July, August%" )
      else
        @crops = Crop.all
      end
    end
end

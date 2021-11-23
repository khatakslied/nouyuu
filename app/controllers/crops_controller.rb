class CropsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :toggle_favorite ]

  def index
    @crops = policy_scope(Crop).all

    respond_to do |format|
      format.html
      format.text { render partial: 'crops/crops.html', locals: { crops: @crops } }
    end
  end

  def toggle_favorite
    @crop = Crop.find_by(id: params[:id])
    current_user.favorited?(@crop) ? current_user.unfavorite(@crop) : current_user.favorite(@crop)
  end
end

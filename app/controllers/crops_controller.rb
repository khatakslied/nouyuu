class CropsController < ApplicationController
  def index
    @crops = policy_scope(Crop).all
    @favorites = current_user.favorited_by_type('Crop')
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
end

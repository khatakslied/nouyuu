class CropsController < ApplicationController
  def index
    @crops = policy_scope(Crop).all

    if params[:query].present?
      @cropes = Crop.where('name ILIKE ?', "%#{params[:query]}%")
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

    respond_to do |format|
      format.json { render @crop }
    end
  end

  def favorite
    @favorites = current_user.favorited_by_type('Crop')
    authorize @favorites
  end
end

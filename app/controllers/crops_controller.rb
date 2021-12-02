class CropsController < ApplicationController
  def index
    @date = Date.today
    @current_month = @date.strftime("%B")
    @crops =
      if params[:query].present?
        policy_scope(Crop.search_by_name_and_sowing_months(params[:query]))
      else
        policy_scope(Crop).all.order(name: :ASC)
      end
    @favorite_crops = current_user.favorites_by_type('Crop').count
  end

  def show
    @crop = Crop.find(params[:id])
    authorize @crop
    @favorite_crops = current_user.favorites_by_type('Crop').count
  end

  def toggle_favorite
    @crop = Crop.find_by(id: params[:id])
    authorize @crop
    current_user.favorited?(@crop) ? current_user.unfavorite(@crop) : current_user.favorite(@crop)

    respond_to do |format|
      format.json { render json: @crop }
    end
  end

  def favorite
    @favorites = current_user.favorited_by_type('Crop')
    authorize @favorites
  end
end

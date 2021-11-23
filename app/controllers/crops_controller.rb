class CropsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @crops = policy_scope(Crop).all

    respond_to do |format|
      format.html
      format.text { render partial: 'crops/crops.html', locals: { crops: @crops } }
    end
  end

  def show
  end
end

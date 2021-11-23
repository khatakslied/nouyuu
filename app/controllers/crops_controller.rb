class CropsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
    @crops = ["tomatoes", "carrots"]

    respond_to do |format|
      format.html
      format.text { render partial: 'crops.html', locals: { crops: @crops } }
    end
  end

  def show
  end
end

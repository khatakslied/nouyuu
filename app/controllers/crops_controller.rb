class CropsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
    @crops = Crop.all
  end

  def show
  end
end

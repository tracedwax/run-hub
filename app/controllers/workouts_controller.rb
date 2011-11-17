class WorkoutsController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def new
  end
  
  def create
  end

  def show_week
    @period = TrainingPeriod.new current_user.id, TrainingPeriod.parse_date(params[:startdate])
  end
end

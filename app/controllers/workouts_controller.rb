class WorkoutsController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def new
    @workout = Workout.new(:user_id => current_user.id)
  end
  
  def create
    date = params[:workout]["when(2i)"] + "-" + params[:workout]["when(3i)"] + "-" + params[:workout]["when(1i)"]
    redirect_to :action => "show_week", :startdate => date
  end

  def show_week
    @period = TrainingPeriod.new current_user.id, TrainingPeriod.parse_date(params[:startdate])
  end
end

class WorkoutsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @period = TrainingPeriod.new current_user.id, DateTime.now.in_time_zone.midnight
  end

  def new
    @workout = Workout.new
  end
  
  def create
    date = params[:workout]["when(2i)"] + "-" + params[:workout]["when(3i)"] + "-" + params[:workout]["when(1i)"]
 
    workout = Workout.create params[:workout]
    workout.user_id = current_user.id
    workout.save!

    redirect_to :action => "show_week", :startdate => date
  end

  def show_week
    @period = TrainingPeriod.new current_user.id, TrainingPeriod.parse_date(params[:startdate])
  end
end

class WorkoutsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @writable = true
    @period = TrainingPeriod.new current_user.id, DateTime.now.in_time_zone.midnight
  end

  def new
    @workout = Workout.new
  end

  def new_with_date
    @workout = Workout.new
    @workout_date = TrainingPeriod.parse_date params[:date]
    render :action => "new"
  end
  
  def create
    date = params[:workout]["when(2i)"] + "-" + params[:workout]["when(3i)"] + "-" + params[:workout]["when(1i)"]
    duration = Duration.new :hours   => params[:duration]["hours"],
                            :minutes => params[:duration]["minutes"],
                            :seconds => params[:duration]["seconds"]
 
    workout = Workout.create params[:workout]
    workout.user_id = current_user.id
    workout.duration = duration
    workout.save!

    redirect_to :action => "show_week", :startdate => date
  end

  def show_week
    @writable = true
    @period = TrainingPeriod.new current_user.id, TrainingPeriod.parse_date(params[:startdate])
  end
end

class WorkoutsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @period = TrainingPeriod.new current_user.id, DateTime.now.in_time_zone
  end

  def show_week
    @period = TrainingPeriod.new current_user.id, TrainingPeriod.parse_date(params[:startdate])
  end
end

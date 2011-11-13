class WorkoutsController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def show_week
    @period = TrainingPeriod.new TrainingPeriod.parse_date(params[:startdate])
  end
end

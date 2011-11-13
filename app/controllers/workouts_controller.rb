class WorkoutsController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def show_week
    @period = TrainingPeriod.new params[:startdate]
  end
end

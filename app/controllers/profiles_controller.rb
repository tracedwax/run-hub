class ProfilesController < ApplicationController
  def show
    @user = User.find params[:user_id]
  end

  def show_week
    @period = TrainingPeriod.new params[:user_id],
              TrainingPeriod.parse_date(params[:start_date])
  end
end

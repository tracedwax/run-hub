class ProfilesController < ApplicationController
  def show
    @user = User.find_by_username params[:username]
  end

  def show_week
    @user = User.find_by_username params[:username]
    @writable = false
    @period = TrainingPeriod.new User.find_by_username(params[:username]).id,
              TrainingPeriod.parse_date(params[:start_date])
  end

  def show_this_week
    @user = User.find_by_username params[:username]
    @writable = false

    @period = TrainingPeriod.new User.find_by_username(params[:username]).id,
              TrainingPeriod.parse_date(DateTime.now.strftime("%m-%d-%Y"))

    render :action => "show_week"
  end
end

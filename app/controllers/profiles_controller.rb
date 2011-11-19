class ProfilesController < ApplicationController
  def show
    @user = User.find params[:user_id]
  end

  def show_week
  end
end

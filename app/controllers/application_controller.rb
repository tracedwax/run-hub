class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :facebook_login
  layout :layout_by_resource

  def after_sign_up_path_for(resource)
    "/workouts"
  end

  private

  def facebook_login
    raise '13'
    if params[:uid].present?
      sign_in(User.find_or_create(params[:uid], params[:fbtoken]))
      redirect_to root_path
    end
  end

  def layout_by_resource
    if devise_controller?
      "homepage"
    else
      "application"
    end
  end
end

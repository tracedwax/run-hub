class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource

  def after_sign_up_path_for(resource)
    "/workouts"
  end

  private
  def layout_by_resource
    if devise_controller?
      "homepage"
    else
      "application"
    end
  end
end

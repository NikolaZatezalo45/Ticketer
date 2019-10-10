class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if current_user.is_normal?
      stored_location_for(resource) || events_path 
    else
    stored_location_for(resource) || user_path(current_user)
    end
  end
end

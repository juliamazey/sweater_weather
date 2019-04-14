class ApplicationController < ActionController::Base

  def find_user(strong_params)
    user = User.find_by(api_key: favorites_params[:api_key])
  end

end

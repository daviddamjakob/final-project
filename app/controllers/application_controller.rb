class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:username, :bio, :fb_account, :twitter_account, :linkedin_account, :medium_account])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:username, :bio, :fb_account, :twitter_account, :linkedin_account, :medium_account])
  end
  
  
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  skip_before_action :verify_authenticity_token, raise: false
end

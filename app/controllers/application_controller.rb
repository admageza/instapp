class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
   def authenticate
     redirect_to log_in_path unless session != nil
   end
   
   def delete
     session.delete(:user_id)
     @current_user = nil
     redirect_to site_home_path
   end
end

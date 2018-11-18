class ApplicationController < ActionController::Base

  private

  def current_user
    if session[:user_id].present?
      @current_user ||= User.find(session[:user_id])
    end
  end
  helper_method :current_user

  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?

end

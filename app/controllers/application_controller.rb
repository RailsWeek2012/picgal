class ApplicationController < ActionController::Base
  #TODO [1]: Aus dem Bookmarkmanager-Foliensatz übernommen.
  protect_from_forgery

  private
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def user_signed_in?
    current_user.present?
  end

  helper_method :user_signed_in?
  helper_method :current_user
end

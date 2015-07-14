class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authentication_required
    unless current_user.present?
      redirect_to signin_url
    end
  end

  def current_user
    User.where(id: session[:current_user_id]).first
  end
  helper_method :current_user

  def signed_in?
    current_user.present?
  end
  helper_method :signed_in?
end

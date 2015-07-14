class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authentication_required
    unless current_user.present?
      # redirect_to signin_url
    end
  end

  def current_user
    User.find(session[:current_user_id])
  end
end

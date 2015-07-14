class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.where(username: params[:username_or_email]).first || User.where(email: params[:username_or_email]).first
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to @user
    else
      redirect_to login_url
    end
  end

  def destroy
  end
end

class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.where(username: params[:username_or_email]).first || User.where(email: params[:username_or_email]).first
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id

      flash[:notice] = 'Logged in successfully.'
      redirect_to @user
    else
      flash[:error] = 'There was a problem logging you in.'
      redirect_to login_url
    end
  end

  def destroy
  end
end

class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.where(username: params[:username_or_email]).first || User.where(email: params[:username_or_email]).first
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id

      flash[:notice] = 'Signed in successfully.'
      redirect_to @user
    else
      flash[:error] = 'There was a problem signing you in.'
      redirect_to signin_url
    end
  end

  def destroy
    session[:current_user_id] = nil
    flash[:notice] = 'Signed out successfully.'
    redirect_to root_url
  end
end

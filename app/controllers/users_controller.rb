class UsersController < ApplicationController

  def index
    @users = User.order('created_at DESC').paginate(page: params[:page], per_page: 5)
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      flash[:notice] = 'User created successfully.'
      redirect_to user_profile_url(@user.username)
    else
      flash[:error] = 'There was a problem creating this user.'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'User updated successfully.'
      respond_to do |format|
        format.html { redirect_to user_profile_url(@user.username) }
        format.json { render json: @user.to_json(methods: :profile_image_url) }
      end
    else
      flash[:error] = 'There was a problem updating this user.'
      respond_to do |format|
        format.html { render :edit }
      end
    end
  end

  def show
    @user = User.where(id: params[:id]).first || User.where(username: params[:username]).first

    respond_to do |format|
      format.html
      format.json { render json: @user.to_json(methods: :profile_image_url) }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :image)
  end
end

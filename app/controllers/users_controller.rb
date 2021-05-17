class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  def show
       @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save

      redirect_to user_path(@user.id)
      else
        render :new
      end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "I edited the blog!"
    else
    render :edit
    end
  end

  def set_user
    @user = user.find(params[:id])
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice:"I deleted the blog!"
  end



  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar1, :avatar1_cache)

    end
  end

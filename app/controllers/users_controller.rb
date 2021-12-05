class UsersController < ApplicationController
before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.activated_user.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
   @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Foods & Drinks!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                :password_confirmation)
  end


end

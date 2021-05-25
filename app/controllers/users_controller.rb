class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
  
    if @user.save
      session[:user_id]= @user.id
      redirect_to home_path, notice: 'Logged in!'
    else
      p @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update user_params
      redirect_to home_path(@user), notice: 'User Updated'
    else
      render :show
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end

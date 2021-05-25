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
      render :edit, alert: 'Failed to update'
    end
  end

  def password_edit
    @user = current_user
    render :password
  end

  def password_update
    @user = current_user
    p '*** line 39 ***'

    if @user.authenticate(params[:password])
    p '*** line 42 ***'
      if password_confirm?
    p '*** line 44 ***'
        if @user.update user_params
    p '*** line 46 ***'
          redirect_to home_path, notice: 'Password Changed'
        else
    p '*** line 49 ***'
          render :password, alert: 'Failed to change password'
        end
      else
    p '*** line 53 ***'
        render :password, alert: 'New password typed incorrect'
      end
    else 
    p '*** line 57 ***'
      render :password, alert: 'Incorrect Password'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def password_confirm?
    p '*** line 69 ***'
    params[:new_password] === params[:password_confirmation]
  end

end

class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      session[:user_id]=@user.id
      redirect_to home_path, notice: 'Logged In'
    else
      # flash[:alert] = 'Wrong email password'
      render :new, alert: 'Wrong email password'
    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to home_path, notice: 'Logged Off'
  end

end

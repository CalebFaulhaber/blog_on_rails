class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      redirect_to home_path, notice: 'Logged In'
    else
      flash[:alert] = "Couldn't sign in"
      render :new
    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to home_path, notice: 'Logged Off'
  end

end

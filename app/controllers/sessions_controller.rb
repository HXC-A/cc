class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      signin_user @user
      flash[:notice] = "Login Successful"
      redirect_to root_path
    else
      flash[:notice] = "Incorrect Username or Password"
      render action: :new
    end
  end

  def destroy
    logout_user
    flash[:notice] = "Exit Successfully"
    redirect_to root_path
  end
end

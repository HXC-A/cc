class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))
    if @user.save
      flash[:notice] = "Registration successful! Please log in"
      redirect_to new_session_path
    else
      render action: :new
    end
  end
end
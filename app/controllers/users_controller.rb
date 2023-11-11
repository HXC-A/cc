class UsersController < ApplicationController

  before_action :auth_user, only: [:index]

  def index
    @users = User.page(params[:page] || 1).per_page(params[:per_page] || 10)
      .order("id desc")
  end

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

  def blogs
    @blogs = current_user.blogs.page(params[:page] || 1).per_page(params[:per_page] || 10)
      .order("id desc")
  end

  def add_friend
    friend = User.find(params[:friend_id])
  
    if current_user != friend
      current_user.add_friend(friend)
      flash[:notice] = "Added successfully"
    else
      flash[:notice] = "You cannot add yourself as a friend."
    end
  
    redirect_back(fallback_location: root_path)
  end

  def remove_friend
    friend = User.find(params[:friend_id])
    if current_user.is_friend_with?(friend)
      current_user.remove_friend(friend)
      flash[:notice] = "Friend removed successfully"
    else
      flash[:notice] = "Friend not found"
    end

    redirect_back(fallback_location: root_path)
  end

  def friends
    @friends = current_user.friends.page(params[:page] || 1).per_page(params[:per_page] || 10)
      .order("id desc")
  end
end
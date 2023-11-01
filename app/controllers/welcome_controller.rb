class WelcomeController < ApplicationController
  def index
    @user = if session[:user_id]
      User.find_by(id: session[:user_id])
    else
      nil
    end
  end
end

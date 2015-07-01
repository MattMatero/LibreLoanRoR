class HomeController < ApplicationController

  def profile
    if params[:name]
      @user = User.find_by(username: params[:name])
    else
      @user = current_user
    end
  end
end

class HomeController < ApplicationController

  def profile
    if params[:name]
      @user = User.find_by(username: params[:name])
    elsif current_user
      @user = current_user
    else
      redirect_to root_path
    end
  end
end

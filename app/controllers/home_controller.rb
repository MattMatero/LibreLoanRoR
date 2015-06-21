class HomeController < ApplicationController

  def profile
    if current_user.nil?
      redirect_to root_path, alert: "Please Log In"
    end
  end
end

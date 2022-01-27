class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to(users_authenticated_root_path) and return
    end
  end
end

class HomeController < ApplicationController
  before_action :authenticate_user!
    # GET /groups or /groups.json
    def index
      @user = current_user
      @posts = Post.all
      @groups = @user.groups
    end
end

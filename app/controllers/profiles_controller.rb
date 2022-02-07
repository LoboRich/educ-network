class ProfilesController < ApplicationController
    before_action :authenticate_user!
    # GET /groups or /groups.json
    def index
      @user = current_user
      @groups = @user.groups
      @posts = current_user.posts
    end
  
  end
  
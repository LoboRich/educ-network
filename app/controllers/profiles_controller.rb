class ProfilesController < ApplicationController
    before_action :authenticate_user!
    # GET /groups or /groups.json
    def index
      @user = current_user
      @groups = @user.groups
      @posts = @user.posts
    end
  
  end
  
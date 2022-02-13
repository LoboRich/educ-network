class ProfilesController < ApplicationController
    before_action :authenticate_user!
    # GET /groups or /groups.json
    def index
      @user = current_user
      @groups = @user.groups
      @posts = current_user.posts.order("created_at DESC")
    end

    def feed
      @groups = current_user.groups
      @posts = current_user.posts.order("created_at DESC")
      @post = Post.new
      @comment = Comment.new
    end

  end
  
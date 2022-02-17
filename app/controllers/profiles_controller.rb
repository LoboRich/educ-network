class ProfilesController < ApplicationController
  before_action :authenticate_user!
  # GET /groups or /groups.json
  def index
    @user = current_user
    @groups = @user.groups
    @posts = current_user.posts.order("created_at DESC")
  end

  def feed
    @groups = GroupsHelper.list(current_user)
    @grpids = @groups.pluck(:id)
    @posts = Post.where(group_id: @grpids).order("created_at DESC")
    @post = Post.new
    @comment = Comment.new
  end
end
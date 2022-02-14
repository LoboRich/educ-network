class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :set_group, except: %i[ create2 ]
  # GET /posts or /posts.json
  def index
    @posts = @group.posts
  end

  # GET /posts/1 or /posts/1.json
  def show
    @comments  = @post.comments.where.not(id: nil)
    @comment = @post.comments.build
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit

  end

  # POST /posts or /posts.json
  def create
    @post = @group.posts.build(post_params)
		@group.posts << @post

    respond_to do |format|
      if @post.save
        format.html { redirect_to group_path(@group), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def create2
    @post = Post.new(post_params)
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to '/feed', notice: "Post was successfully created." }
      else
        format.html { redirect_to '/feed', notice: "Post was not created." }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to group_path(@group), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to group_path(@group), notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_group
      @group = Group.find(params[:group_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:content, :group_id, :user_id)
    end

end

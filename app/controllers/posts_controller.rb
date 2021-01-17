class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :download]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.where("is_private = 'f' OR user_id = #{current_user.id rescue 0}")
  end

  def my_posts
    @posts = current_user.posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    is_private = params['post']['is_private'] == 1

    params['post']['images'].each do |image|
      current_user.posts.build(image: image, is_private: is_private)
    end
    
    respond_to do |format|
      if current_user.save
        format.html { redirect_to posts_path, notice: 'Posts was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    redirect_to posts_url if @post.user_id != current_user&.id
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    redirect_to posts_url if @post.user_id != current_user&.id
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download 
    if !@post.is_private || @post.user_id == current_user&.id
      path = "uploads/post/image/#{params['id']}/#{params['basename']}.#{params['extension']}"
      send_file path, type: "image/#{params['extension']}", disposition: 'inline'
    else
      redirect_to posts_path
    end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:is_private, :image)
    end
end

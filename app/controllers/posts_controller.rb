class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)


    if @post.save


      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  # POST /posts/fetch
  # topic_id:
  # offset:
  # limit:
  def fetch
    sort = 'created_at ASC'

    posts = Post.where("topic_id = ?", params[:topic_id]).order(sort).offset(params[:offset]).limit(params[:limit])

    render json: posts
  end

  def reply_topic

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:group_id, :topic_id, :creator_id, :content, :likes, :dislikes, :is_op, :is_anonymous, :edit_date)
    end
end

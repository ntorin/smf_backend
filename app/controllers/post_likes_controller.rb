class PostLikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post_like, only: [:show, :update, :destroy]

  # GET /post_likes
  def index
    @post_likes = PostLike.all

    render json: @post_likes
  end

  # GET /post_likes/1
  def show
    render json: @post_like
  end

  # POST /post_likes
  def create
    if !PostLike.exists?(post_id: params[:post_like][:post_id], user_id: params[:post_like][:user_id])
      @post_like = PostLike.new(post_like_params)

      if @post_like.save
        render json: @post_like, status: :created, location: @post_like
      else
        render json: @post_like.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /post_likes/1
  def update
    if @post_like.update(post_like_params)
      render json: @post_like
    else
      render json: @post_like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /post_likes/1
  def destroy
    @post_like.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_like
      @post_like = PostLike.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_like_params
      params.require(:post_like).permit(:post_id, :user_id, :is_like)
    end
end

class FollowsController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_follow, only: [:show, :update, :destroy]

  # GET /follows
  def index
    @follows = Follow.all

    render json: @follows
  end

  # GET /follows/1
  def show
    render json: @follow
  end

  # POST /follows
  def create
    if !Follow.exists?(following_id: params[:follow][:following_id], follower_id: params[:follow][:follower_id])
      @follow = Follow.new(follow_params)

      if @follow.save
        render json: @follow, status: :created, location: @follow
      else
        render json: @follow.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /follows/1
  def update
    if @follow.update(follow_params)
      render json: @follow
    else
      render json: @follow.errors, status: :unprocessable_entity
    end
  end

  # DELETE /follows/1
  def destroy
    @follow.destroy
  end

  # POST /follows/fetch
  # user_id:
  # page:
  # per_page:
  def fetch
    follows = Follow.where(follower_id: params[:user_id])
    paginate json: follows.to_json(:include => :following)
  end

  # POST /follows/check_request
  # user_id:
  # following_id:
  def check_request
    follow = Follow.where(following_id: params[:following_id], follower_id: params[:user_id]).first
    if follow.present?
      render json: {follow: follow, status: 'followed'}
    else
      render json: { status: 'none'}
    end
  end

  # POST /follows/my_follows
  # user_id:
  # page:
  def my_follows
    follows = paginate Follow.where(follower_id: params[:user_id])

    render json: follows.to_json(:include => :following)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow
      @follow = Follow.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def follow_params
      params.require(:follow).permit(:following_id, :follower_id)
    end
end

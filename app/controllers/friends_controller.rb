class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :update, :destroy]

  # GET /friends
  def index
    @friends = Friend.all

    render json: @friends
  end

  # GET /friends/1
  def show
    render json: @friend
  end

  # POST /friends
  def create
    request = Friend.where(friend_one: params[:friend][:friend_two], friend_two: params[:friend][:friend_one]).first

    if !request.blank? # check if other user sent friend request previously; if they did, accept the request
      request.update(is_accepted: true)

      render json: request
    elsif !Friend.exists?(friend_one: params[:friend][:friend_one], friend_two: params[:friend][:friend_two]) # if the request isn't a duplicate, create a new one
    @friend = Friend.new(friend_params)

      if @friend.save
        render json: @friend, status: :created, location: @friend
      else
        render json: @friend.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /friends/1
  def update
    if @friend.update(friend_params)
      render json: @friend
    else
      render json: @friend.errors, status: :unprocessable_entity
    end
  end

  # DELETE /friends/1
  def destroy
    @friend.destroy
  end

  # POST
  # request_id:
  def accept_request
    request = Friend.find(params[:request_id])

    if !request.is_accepted
      request.update(is_accepted: true)

      render json: request
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def friend_params
      params.require(:friend).permit(:friend_one, :friend_two, :is_accepted)
    end
end

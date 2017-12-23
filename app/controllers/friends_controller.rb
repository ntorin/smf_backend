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

  # POST /friends/fetch
  # user_id:
  # fetch_type:
  # offset:
  # limit:
  def fetch
    friends = [{}]

    case params[:fetch_type]
      when 'all'
        friends = paginate Friend.where("(friend_one = ? OR friend_two = ?) AND is_accepted = true", params[:user_id], params[:user_id])
      when 'incoming'
        friends = paginate Friend.where("friend_two = ? AND is_accepted = false", params[:user_id])
      when 'outgoing'
        friends = paginate Friend.where("friend_one = ? AND is_accepted = false", params[:user_id])
    end

    #friend_users = []

    #friends.each do |f|
    #  if f.friend_one == params[:user_id]
    #    friend_users.push(f.friend_two)
    #  else
    #    friend_users.push(f.friend_one)
    #  end
    #end

    #users = User.where(id: friend_users)

    render json: friends.to_json(:include => :friend)
  end

  # POST /follows/check_request
  # user_id:
  # friend_id:
  def check_request
    request = Friend.where("(friend_one = ? AND friend_two = ?) OR (friend_one = ? AND friend_two = ?)",
                           params[:user_id], params[:friend_id],
                           params[:friend_id], params[:user_id]).first
    if request.exists
      if request.is_accepted
        render json: { status: 'friends'}
      else
        if request.friend_one == params[:user_id]
          render json: { status: 'awaiting response'}
        else
          render json: { status: 'accept request'}
        end
      end
    else
      render json: { status: 'none'}
    end
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

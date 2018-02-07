class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :update, :destroy]

  # GET /feeds
  def index
    @feeds = Feed.all

    render json: @feeds
  end

  # GET /feeds/1
  def show
    render json: @feed
  end

  # POST /feeds
  def create
    @feed = Feed.new(feed_params)

    if @feed.save
      render json: @feed, status: :created, location: @feed
    else
      render json: @feed.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /feeds/1
  def update
    if @feed.update(feed_params)
      render json: @feed
    else
      render json: @feed.errors, status: :unprocessable_entity
    end
  end

  # DELETE /feeds/1
  def destroy
    @feed.destroy
  end

  # POST /feeds/fetch
  # user_id
  # fetch_type
  # activty_id
  # page
  # per_page
  def fetch
    feeds = [{}]

    case params[:fetch_type]
      when 'all'
        ids = []
        friends = Friend.where("(friend_one = ? OR friend_two = ?) AND is_accepted = true", params[:user_id], params[:user_id])
        friends.each do |f|
          if f.friend_one == params[:user_id]
            ids.push(f.friend_two)
          else
            ids.push(f.friend_one)
          end
        end

        follows = Follow.where(follower_id: params[:user_id])

        follows.each do |f|
          if !ids.include?(f.following_id)
            ids.push(f.following_id)
          end
        end

        feeds = paginate Feed.where(user_id: ids).order('created_at DESC')
      when 'friends'
        ids = []
        friends = Friend.where("(friend_one = ? OR friend_two = ?) AND is_accepted = true", params[:user_id], params[:user_id])
        friends.each do |f|
          if f.friend_one == params[:user_id]
            ids.push(f.friend_two)
          else
            ids.push(f.friend_one)
          end
        end
        feeds = paginate Feed.where(user_id: ids).order('created_at DESC')
      when 'follows'
        feeds = paginate Feed.joins(:follow).where(:follows => {follower_id: params[:user_id]}).order('created_at DESC')
      when 'user'
        feeds = paginate Feed.where(user_id: params[:activity_id]).order('created_at DESC')
      when 'group'
        feeds = paginate Feed.where(group_id: params[:activity_id]).order('created_at DESC')

    end

    render json: feeds.to_json(:include => :user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feed = Feed.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def feed_params
      params.require(:feed).permit(:user_id, :group_id, :source_id, :feed_type, :deep_link)
    end
end

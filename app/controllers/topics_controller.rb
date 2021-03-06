class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :update, :destroy]

  # GET /topics
  def index
    @topics = Topic.all
    paginate json: @topics
  end

  # GET /topics/1
  def show
    render json: @topic
  end

  # POST /topics
  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      render json: @topic, status: :created, location: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /topics/1
  def update
    if @topic.update(topic_params)
      render json: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /topics/1
  def destroy
    @topic.destroy
  end

  # POST /topics/fetch
  # group_id:
  # sort_by:
  # page:
  # per_page:
  # query:
  # pinned:
  def fetch
    sort = 'last_post_date DESC'

    case params[:sort_by]
      when 'recent'
        sort = 'last_post_date DESC'
      else
    end

    q = '%' + params[:query].to_s.downcase + '%'

    if params[:pinned]
      topics = paginate Topic.where("group_id = ? AND is_pinned IS TRUE", params[:group_id])
                            .joins(:user)
                            .order(sort)
    else
      topics = paginate Topic.where("group_id = ? AND (LOWER(title) LIKE ? OR lower(tags) LIKE ?)", params[:group_id], q, q)
                            .joins(:user)
                            .order(sort)
    end

    render json: topics.to_json(:include => :user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def topic_params
      params.require(:topic).permit(:group_id, :user_id, :title, :topic_type, :is_anonymous, :is_pinned, :is_locked,
                                    :tags, :post_count, :last_post_date)
    end
end

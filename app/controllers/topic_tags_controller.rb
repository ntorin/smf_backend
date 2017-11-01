class TopicTagsController < ApplicationController
  before_action :set_topic_tag, only: [:show, :update, :destroy]

  # GET /topic_tags
  def index
    @topic_tags = TopicTag.all

    render json: @topic_tags
  end

  # GET /topic_tags/1
  def show
    render json: @topic_tag
  end

  # POST /topic_tags
  def create
    @topic_tag = TopicTag.new(topic_tag_params)

    if @topic_tag.save
      render json: @topic_tag, status: :created, location: @topic_tag
    else
      render json: @topic_tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /topic_tags/1
  def update
    if @topic_tag.update(topic_tag_params)
      render json: @topic_tag
    else
      render json: @topic_tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /topic_tags/1
  def destroy
    @topic_tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic_tag
      @topic_tag = TopicTag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def topic_tag_params
      params.require(:topic_tag).permit(:topic_id, :name)
    end
end

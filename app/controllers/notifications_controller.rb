class NotificationsController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_notification, only: [:show, :update, :destroy]

  # GET /notifications
  def index
    @notifications = Notification.all

    render json: @notifications
  end

  # GET /notifications/1
  def show
    render json: @notification
  end

  # POST /notifications
  def create
    @notification = Notification.new(notification_params)

    if @notification.save
      render json: @notification, status: :created, location: @notification
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notifications/1
  def update
    if @notification.update(notification_params)
      render json: @notification
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notifications/1
  def destroy
    @notification.destroy
  end
  
  # POST /notifications/fetch
  # user_id
  # page
  # per_page
  def fetch
    notifications = Notification.where(user_id: params[:user_id])
                        .order('created_at DESC')
    paginate json: notifications
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def notification_params
      params.require(:notification).permit(:user_id, :notification_type, :description, :is_seen, :goto_id)
    end
end

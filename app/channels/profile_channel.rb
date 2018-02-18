class ProfileChannel < ApplicationCable::Channel
  def subscribed
    stream_from "profile_#{params[:room]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

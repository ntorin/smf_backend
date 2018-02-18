class CreditHistory < ApplicationRecord
  after_create :emit_update

  def emit_update
    user = User.find(self.user_id)
    ActionCable.server.broadcast("profile_#{self.user_id}", {user: user, action: 'profile_update'})
  end
end

class Referral < ApplicationRecord
  after_create :send_notifications

  def send_notifications
    Notification.create({
                            user_id: self.referrer_id,
                            group_id: -1,
                            source_id: self.user_id,
                            notification_type: 'referral-create',
                            description: 'You have referred a new user!',
                            is_seen: false,
                            deep_link: 'user/' + self.user_id.to_s
                        })
    end
end

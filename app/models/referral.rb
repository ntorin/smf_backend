class Referral < ApplicationRecord
  after_create :increment_values

  def increment_values
    User.increment_counter(:referral_count, self.referrer_id)

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

class Post < ApplicationRecord
  after_create :increment_values
  after_destroy :decrement_values
  after_update :update_preview

  belongs_to :user

  #validates :content, {maximum: 20000}

  def increment_values
    Group.increment_counter(:post_count, self.group_id)
    Topic.increment_counter(:post_count, self.topic_id)
    User.increment_counter(:post_count, self.user_id)
    User.increment_counter(:daily_post_count, self.user_id)
    User.increment_counter(:weekly_post_count, self.user_id)
    User.increment_counter(:monthly_post_count, self.user_id)

    user = User.find(self.user_id)

    if user.daily_post_count == 1
      User.update_counters(self.user_id, credits: 1000)
      CreditHistory.create({user_id: self.user_id, credit_transaction: 1000, description: 'activity-daily-1post', source_id: self.id})
    end

    if user.weekly_post_count == 10
      User.update_counters(self.user_id, credits: 10000)
      CreditHistory.create({user_id: self.user_id, credit_transaction: 10000, description: 'activity-weekly-10posts', source_id: self.id})
    end

    if user.monthly_post_count == 100
      User.update_counters(self.user_id, credits: 100000)
      CreditHistory.create({user_id: self.user_id, credit_transaction: 100000, description: 'activity-monthly-100posts', source_id: self.id})
    end

    if self.is_op
      Topic.find(self.topic_id).update(preview: self.content[0..50], last_post_date: DateTime.now)
    end

    User.update_counters(self.user_id, credits: 1000)
    CreditHistory.create({user_id: self.user_id, credit_transaction: 1000, description: 'user-post', source_id: self.id})

    if User.exists?(id: self.user_id) && User.find(self.user_id).post_count <= 100
      ref = Referral.where(user_id: self.user_id).first
      if ref.exists?
        User.update_counters(ref.referrer_id, credits: 1000)
        CreditHistory.create({user_id: ref.referrer_id, credit_transaction: 1000, description: 'referral-post', source_id: self.id})
      end
    end

    Feed.create({user_id: self.user_id, group_id: self.group_id, source_id: self.id, feed_type: 'post-create', deep_link: 'post/' + self.id.to_s})
  end

  def update_preview
    if self.is_op
      Topic.find(self.topic_id).update(preview: self.message[0..50])
    end
  end

  def decrement_values
    Group.decrement_counter(:post_count, self.group_id)
    Topic.decrement_counter(:post_count, self.topic_id)
    User.decrement_counter(:post_count, self.user_id)

    Notification.create({
                            user_id: self.user_id,
                            group_id: self.group_id,
                            source_id: self.topic_id,
                            notification_type: 'post-deletion',
                            description: 'One of your posts has been deleted.',
                            is_seen: false,
                            deep_link: 'topic/' + self.topic_id.to_s
                        })
  end
end

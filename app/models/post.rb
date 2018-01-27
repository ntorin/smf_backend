class Post < ApplicationRecord
  after_create :increment_values
  after_destroy :decrement_values
  after_update :update_preview

  belongs_to :user

  def increment_values
    Group.increment_counter(:post_count, self.group_id)
    Topic.increment_counter(:post_count, self.topic_id)
    User.increment_counter(:post_count, self.user_id)

    Topic.find(self.topic_id).update(preview: self.content[0..50], last_post_date: DateTime.now)

    User.update_counters(self.user_id, credits: 1000)
    CreditHistory.create({user_id: self.user_id, credit_transaction: 1000, description: 'post'})

    if User.find(self.user_id).post_count <= 100
      ref = Referral.where(user_id: self.user_id)
      if ref.exists?
        User.update_counters(ref.referrer_id, credits: 1000)
        CreditHistory.create({user_id: ref.referrer_id, credit_transaction: 1000, description: 'referral-post'})
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

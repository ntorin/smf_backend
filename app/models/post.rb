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
  end
end

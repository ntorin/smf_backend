class Post < ApplicationRecord
  after_create :increment_values
  after_destroy :decrement_values

  belongs_to :user

  def increment_values
    Group.increment_counter(:post_count, self.group_id)
    Topic.increment_counter(:post_count, self.topic_id)
    User.increment_counter(:post_count, self.user_id)

    Topic.find(self.topic_id).update(last_post_date: DateTime.now)
    Feed.create({user_id: self.user_id, source_id: self.id, feed_type: 'post-create', deep_link: 'post/' + self.id.to_s})
  end

  def decrement_values
    Group.decrement_counter(:post_count, self.group_id)
    Topic.decrement_counter(:post_count, self.topic_id)
    User.decrement_counter(:post_count, self.user_id)
  end
end

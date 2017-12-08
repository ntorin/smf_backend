class Post < ApplicationRecord
  after_create :increment_values
  after_destroy :decrement_values

  def increment_values
    Group.increment_counter(:post_count, self.group_id)
    Topic.increment_counter(:post_count, self.topic_id)
    User.increment_counter(:post_count, self.creator_id)

    Topic.find(self.topic_id).update(last_post_date: DateTime.now)
  end

  def decrement_values
    Group.decrement_counter(:post_count, self.group_id)
    Topic.decrement_counter(:post_count, self.topic_id)
    User.decrement_counter(:post_count, self.creator_id)
  end
end

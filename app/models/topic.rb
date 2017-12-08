class Topic < ApplicationRecord
  after_create :increment_values
  after_destroy :decrement_values

  def increment_values
    Group.increment_counter(:topic_count, self.group_id)
    User.increment_counter(:topic_count, self.creator_id)
  end

  def decrement_values
    Group.decrement_counter(:topic_count, self.group_id)
    User.decrement_counter(:topic_count, self.creator_id)
  end
end

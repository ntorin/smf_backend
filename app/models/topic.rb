class Topic < ApplicationRecord
  after_create :increment_values
  after_destroy :decrement_values

  belongs_to :user

  #validates :title, {maximum: 50}

  def increment_values
    Group.increment_counter(:topic_count, self.group_id)
    User.increment_counter(:topic_count, self.user_id)

    Feed.create({user_id: self.user_id, group_id: self.group_id, source_id: self.id, feed_type: 'topic-create', deep_link: 'topic/' + self.id.to_s})
  end

  def decrement_values
    Group.decrement_counter(:topic_count, self.group_id)
    User.decrement_counter(:topic_count, self.user_id)
  end
end

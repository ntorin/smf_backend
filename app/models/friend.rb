class Friend < ApplicationRecord
  after_create :increment_values
  after_destroy :decrement_values
  after_update :send_notifications

  belongs_to :user
  belongs_to :friend, class_name: 'User', :foreign_key => 'friend_two'

  def increment_values
    User.increment_counter(:friend_count, self.friend_one)
    User.increment_counter(:friend_count, self.friend_two)


  end

  def decrement_values
    User.decrement_counter(:friend_count, self.friend_one)
    User.decrement_counter(:friend_count, self.friend_two)
  end

  def send_notifications
    if self.is_accepted_changed? && self.is_accepted
      user = User.find(self.friend_two)
      Notification.create({
                              user_id: self.friend_one,
                              group_id: -1,
                              source_id: self.friend_two,
                              notification_type: 'friend-create',
                              description: user.identifier + ' has accepted your friend request.',
                              is_seen: false,
                              deep_link: 'user/' + self.friend_two.to_s
                          })
    end
  end

  def as_json(options = {})
    h = super(options)
    if options[:requester_id] == self.friend_one
      h[:friend] = User.find(self.friend_two)
    else
      h[:friend] = User.find(self.friend_one)
    end

    return h
  end
end

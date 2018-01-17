class Feed < ApplicationRecord

  belongs_to :group, :foreign_key => 'source_id'
  belongs_to :topic, :foreign_key => 'source_id'
  belongs_to :post, :foreign_key => 'source_id'
  belongs_to :user

  belongs_to :friend, :foreign_key => 'user_id'
  belongs_to :follow, :primary_key => 'following_id', :foreign_key => 'user_id'


  def as_json(options = {})
    h = super(options)
      feed_type = self.feed_type.split(/-/)[0]
      case feed_type
        when 'topic'
          topic = Topic.find(self.source_id)
          h[:feed] = topic
        when 'group'
          group = Group.find(self.source_id)
          h[:feed] = group
        when 'post'
          post = Post.find(self.source_id)
          h[:feed] = post
      end
    return h
  end
end

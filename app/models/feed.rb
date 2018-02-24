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
          if Topic.exists?(self.source_id)
            topic = Topic.find(self.source_id)
            h[:feed] = topic
          else
            h[:feed] = {type: '404'}
          end
        when 'group'
          if Group.exists?(self.source_id)
            group = Group.find(self.source_id)
            h[:feed] = group
          else
            h[:feed] = {type: '404'}
          end
        when 'post'
          if Post.exists?(self.source_id)
            post = Post.find(self.source_id)

            h[:feed] = {post: post, title: Topic.find(post.topic_id).title}
          else
            h[:feed] = {type: '404'}
          end
      end
    return h
  end
end

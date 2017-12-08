class PostLike < ApplicationRecord
  after_save :increment_values
  after_update :edit_values
  after_destroy :decrement_values

  def increment_values
    if self.is_like
      Post.increment_counter(:likes, self.post_id)
    else
      Post.increment_counter(:dislikes, self.post_id)
    end
  end

  def edit_values
    if self.is_like_changed?
      if self.is_like
        Post.decrement_counter(:dislikes, self.post_id)
        Post.increment_counter(:likes, self.post_id)
      else
        Post.decrement_counter(:likes, self.post_id)
        Post.increment_counter(:dislikes, self.post_id)
      end
    end
  end

  def decrement_values
    if self.is_like
      Post.decrement_counter(:likes, self.post_id)
    else
      Post.decrement_counter(:dislikes, self.post_id)
    end
  end
end

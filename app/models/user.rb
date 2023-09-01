class User < ApplicationRecord
  # Associations
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  # Method to get the most recent posts for a user
  def recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end
end

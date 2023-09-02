class Post < ApplicationRecord
  # Establishes a belongs_to association with the User model, using author_id as the foreign key.
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  # Establishes has_many associations with the Comment and Like models.
  has_many :comments
  has_many :likes

  # Validations for the Post model
  validates :title, presence: true
  validates :text, presence: true

  # After saving a post, this callback method updates the author's posts counter.
  after_save :update_author_posts_counter

  # Returns the 'limit' most recent comments for a post, defaults to 5.
  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  private

  # Callback method to update the author's posts counter.
  def update_author_posts_counter
    author.increment!(:posts_count)
  end
end

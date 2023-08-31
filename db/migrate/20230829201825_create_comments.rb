# frozen_string_literal: true

# This migration creates the 'comments' table in the database.
class CreateComments < ActiveRecord::Migration[7.0]
  def change
    # This block creates a new database table named 'comments'.
    create_table :comments do |t|
      # This line establishes a foreign key relationship.
      # It associates the 'author_id' column with the 'users' table.
      # The 'class_name' option specifies the related class, which is 'User'.
      # 'foreign_key: true' adds a foreign key constraint.
      t.belongs_to :author, class_name: 'User', foreign_key: true

      # This line establishes a foreign key relationship.
      # It associates the 'post_id' column with the 'posts' table.
      # 'foreign_key: true' adds a foreign key constraint.
      t.belongs_to :post, foreign_key: true

      # This line defines the column for the content of the comment.
      t.text :text

      # This line defines the column for the creation timestamp of the comment.
      t.datetime :created_at

      # These lines add timestamps columns 'created_at' and 'updated_at'
      # which automatically track when records are created and updated.
      t.timestamps
    end

    # Add indexes to the foreign key columns for better performance
    add_index :comments, :author_id
    add_index :comments, :post_id
  end
end

# Additional Migration for Creating Likes Table
class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    # This block creates a new database table named 'likes'.
    create_table :likes do |t|
      # This line establishes a foreign key relationship.
      # It associates the 'user_id' column with the 'users' table.
      # The 'class_name' option specifies the related class, which is 'User'.
      # 'foreign_key: true' adds a foreign key constraint.
      t.belongs_to :user, class_name: 'User', foreign_key: true

      # This line establishes a foreign key relationship.
      # It associates the 'post_id' column with the 'posts' table.
      # 'foreign_key: true' adds a foreign key constraint.
      t.belongs_to :post, foreign_key: true

      # These lines add timestamps columns 'created_at' and 'updated_at'
      # which automatically track when records are created and updated.
      t.timestamps
    end

    # Add indexes to the foreign key columns for better performance
    add_index :likes, :user_id
    add_index :likes, :post_id
  end
end

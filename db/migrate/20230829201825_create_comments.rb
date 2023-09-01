# This migration creates the 'comments' table in the database.
class CreateComments < ActiveRecord::Migration[7.0]
  def change
    # This block creates a new database table named 'comments'.
    create_table :comments do |t|
      # This line defines a foreign key reference to the 'users' table.
      # The 'author' column is associated with the 'users' table.
      t.references :author, foreign_key: { to_table: :users }

      # This line defines a foreign key reference to the 'posts' table.
      # The 'post' column is associated with the 'posts' table.
      t.references :post, foreign_key: { to_table: :posts }

      # This line defines the column for the content of the comment.
      t.text :text

      # These lines add timestamps columns 'created_at' and 'updated_at'
      # which automatically track when records are created and updated.
      t.timestamps
    end

    # Add a composite index on [:author_id, :post_id] for better performance.
    add_index :comments, [:author_id, :post_id]
  end
end

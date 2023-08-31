class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    # This block creates a new database table named 'posts'.
    create_table :posts do |t|
      # This line establishes a foreign key relationship.
      # It associates the 'author_id' column with the 'users' table.
      # The 'class_name' option specifies the related class, which is 'User'.
      # 'foreign_key: true' adds a foreign key constraint.
      t.belongs_to :author, class_name: 'User', foreign_key: true
      
      # These lines define the columns of the 'posts' table.
      t.string :title           # Column for the post's title
      t.string :photo           # Column for the URL of the post's photo
      t.text :text              # Column for the content of the post
      t.integer :likes_counter, default: 0  # Column to count post likes
      t.integer :comments_counter, default: 0  # Column to count post comments
      
      # These lines add timestamps columns 'created_at' and 'updated_at'
      # which automatically track when records are created and updated.
      t.timestamps
    end
    
    # Add an index to the foreign key column 'author_id'
    add_index :posts, :author_id
  end
end
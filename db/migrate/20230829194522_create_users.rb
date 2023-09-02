# frozen_string_literal: true

# This migration creates the 'users' table in the database.
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    # This block creates a new database table named 'users'.
    create_table :users do |t|
      # These lines define the columns of the 'users' table.
      # The 'string' data type is used for short text fields.
      t.string :name    # Column for the user's name
      t.string :title   # Column for the user's title
      t.string :photo   # Column for the URL of the user's photo
      t.text :text      # Column for longer text content related to the user
      t.text :bio       # Column for the user's biography

      # These lines add timestamps columns 'created_at' and 'updated_at'
      # which automatically track when records are created and updated.
      t.timestamps
    end

    # No need to add an index on a non-existing column
  end
end

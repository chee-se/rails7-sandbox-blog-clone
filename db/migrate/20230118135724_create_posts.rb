# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, limit: 100
      t.datetime :posted_at
      t.datetime :changed_at

      t.timestamps
    end
  end
end

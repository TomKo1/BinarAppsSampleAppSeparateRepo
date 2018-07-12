class CreateCommentCommentator < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_commentators do |t|
      t.integer :comment_id
      t.integer :commentator_id
    end
  end
end

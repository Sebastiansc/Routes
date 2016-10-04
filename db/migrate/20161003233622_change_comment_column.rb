class ChangeCommentColumn < ActiveRecord::Migration
  def change
    remove_column :comments, :topic_type
    add_column :comments, :topic_type, :string
  end
end

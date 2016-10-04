class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :author_id
      t.integer :topic_id
      t.integer :topic_type
      t.timestamps null: false
    end
  end
end

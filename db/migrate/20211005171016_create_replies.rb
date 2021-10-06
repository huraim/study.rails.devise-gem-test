class CreateReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|
      t.integer :reply_id
      t.text :content
      t.timestamps
    end
  end
end

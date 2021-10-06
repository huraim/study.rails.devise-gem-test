class RenameUseridToReply < ActiveRecord::Migration[6.1]
  def change
    rename_column :replies, :reply_id, :user_id
  end
end

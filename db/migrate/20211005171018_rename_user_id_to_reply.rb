class RenameUserIdToReply < ActiveRecord::Migration[6.1]
  def change
    rename_column :replies, :user_id, :post_id
  end
end

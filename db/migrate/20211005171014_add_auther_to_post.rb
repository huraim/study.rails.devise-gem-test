class AddAutherToPost < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :user_id, :integer
    # remove_column :posts, :user_id
    # rename_column :posts, :user_id, :바꿀이름
  end
end

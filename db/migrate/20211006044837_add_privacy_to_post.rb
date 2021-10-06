class AddPrivacyToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :is_privacy, :boolean
  end
end

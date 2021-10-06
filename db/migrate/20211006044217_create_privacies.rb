class CreatePrivacies < ActiveRecord::Migration[6.1]
  def change
    create_table :privacies do |t|
      t.boolean :is_privacy

      t.timestamps
    end
  end
end

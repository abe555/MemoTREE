class AddUserIdToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :user_id, :bigint
  end
end

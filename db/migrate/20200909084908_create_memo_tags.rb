class CreateMemoTags < ActiveRecord::Migration[5.2]
  def change
    create_table :memo_tags do |t|
      t.bigint :memo_id, null: false
      t.bigint :tag_id, null: false
      t.timestamps
    end
  end
end

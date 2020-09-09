class CreateWordTags < ActiveRecord::Migration[5.2]
  def change
    create_table :word_tags do |t|
      t.bigint :word_id, null: false
      t.bigint :tag_id, null: false
      t.timestamps
    end
  end
end

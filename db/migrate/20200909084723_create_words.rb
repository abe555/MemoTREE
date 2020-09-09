class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.bigint :user_id, null: false
      t.string :name, null: false
      t.text :body, null: false
      t.integer :color, null: false, default: 0
      t.integer :pickup, null: false, default: 0
      t.timestamps
    end
  end
end

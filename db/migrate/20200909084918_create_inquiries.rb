class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.string :name, null: false
      t.text :massage, null: false
      t.timestamps
    end
  end
end

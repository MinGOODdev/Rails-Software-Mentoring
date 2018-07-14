class CreateNotices < ActiveRecord::Migration[5.0]
  def change
    create_table :notices do |t|

      t.integer :user_id
      t.string :title, null: false, defalut: ""
      t.string :content, null: false, default: ""
      t.string :attachment, default: ""
      t.integer :hit, null: false, default: 0

      t.timestamps null: false
    end
  end
end

class CreateMidReports < ActiveRecord::Migration[5.0]
  def change
    create_table :mid_reports do |t|

      t.integer :user_id
      t.integer :semester_id
      t.integer :mentor_room_id
      t.string :attachment, null: false

      t.timestamps null: false
    end
  end
end

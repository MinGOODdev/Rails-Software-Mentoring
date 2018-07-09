class CreateMentorRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :mentor_rooms do |t|
      
      t.integer :user_id
      t.string :team_name, null: false
      t.string :subject, null: false
      t.string :purpose, null: false
      t.string :content, null: false
      t.string :method, null: false
      t.integer :semester_id
      t.string :attachment, null: false, default: ""
      t.boolean :mid_report_ok, default: false
      t.boolean :final_report_ok, default: false

      t.timestamps null: false
    end
  end
end

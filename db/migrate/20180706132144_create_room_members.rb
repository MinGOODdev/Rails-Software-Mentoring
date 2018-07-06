class CreateRoomMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :room_members do |t|
      
      t.integer :user_id
      t.integer :mentor_room_id

      t.timestamps null: false
    end
  end
end

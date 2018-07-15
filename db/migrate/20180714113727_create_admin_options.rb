class CreateAdminOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_options do |t|

      t.integer :mentor_apply_active, default: 0
      t.integer :mentee_apply_active, default: 0
      t.integer :room_member_max_num, default: 6

      t.timestamps null: false
    end
  end
end

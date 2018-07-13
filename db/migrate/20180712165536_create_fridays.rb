class CreateFridays < ActiveRecord::Migration[5.0]
  def change
    create_table :fridays do |t|

      t.integer :user_id
      t.integer :am_nine_to_ten, default: 0         # 09:00 ~ 10:00
      t.integer :am_ten_to_eleven, default: 0       # 10:00 ~ 11:00
      t.integer :am_eleven_to_twelve, default: 0    # 11:00 ~ 12:00
      t.integer :pm_twelve_to_one, default: 0       # 12:00 ~ 13:00
      t.integer :pm_one_to_two, default: 0          # 13:00 ~ 14:00
      t.integer :pm_two_to_three, default: 0        # 14:00 ~ 15:00
      t.integer :pm_three_to_four, default: 0       # 15:00 ~ 16:00
      t.integer :pm_four_to_five, default: 0        # 16:00 ~ 17:00
      t.integer :pm_five_to_six, default: 0         # 17:00 ~ 18:00
      t.integer :pm_six_to_seven, default: 0        # 18:00 ~ 19:00
      t.integer :pm_seven_to_eight, default: 0      # 19:00 ~ 20:00
      t.integer :pm_eight_to_nine, defalut: 0       # 20:00 ~ 21:00
      t.integer :pm_nine_to_ten, default: 0         # 21:00 ~ 22:00

      t.timestamps null: false
    end
  end
end

class CreateFridays < ActiveRecord::Migration[5.0]
  def change
    create_table :fridays do |t|

      t.integer :user_id
      t.boolean :am_nine_to_ten, default: false         # 09:00 ~ 10:00
      t.boolean :am_ten_to_eleven, default: false       # 10:00 ~ 11:00
      t.boolean :am_eleven_to_twelve, default: false    # 11:00 ~ 12:00
      t.boolean :pm_twelve_to_one, default: false       # 12:00 ~ 13:00
      t.boolean :pm_one_to_two, default: false          # 13:00 ~ 14:00
      t.boolean :pm_two_to_three, default: false        # 14:00 ~ 15:00
      t.boolean :pm_three_to_four, default: false       # 15:00 ~ 16:00
      t.boolean :pm_four_to_five, default: false        # 16:00 ~ 17:00
      t.boolean :pm_five_to_six, default: false         # 17:00 ~ 18:00
      t.boolean :pm_six_to_seven, default: false        # 18:00 ~ 19:00
      t.boolean :pm_seven_to_eight, default: false      # 19:00 ~ 20:00
      t.boolean :pm_eight_to_nine, defalut: false       # 20:00 ~ 21:00
      t.boolean :pm_nine_to_ten, default: false         # 21:00 ~ 22:00

      t.timestamps null: false
    end
  end
end

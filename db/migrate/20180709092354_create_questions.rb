class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      
      t.integer :user_id
      t.string :title
      t.string :content
      t.integer :hit, null: false, default: 0

      t.timestamps null: false
    end
  end
end

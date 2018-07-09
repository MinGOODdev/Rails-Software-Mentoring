class CreateSemesters < ActiveRecord::Migration[5.0]
  def change
    create_table :semesters do |t|
      
      t.string :semester_name
      t.boolean :semester_able, null: false, default: true

      t.timestamps null: false
    end
  end
end

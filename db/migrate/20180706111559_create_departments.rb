class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :departments do |t|
      
      t.string :departmentName

      t.timestamps null: false
    end
  end
end

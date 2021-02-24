class CreateDepartmentMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :department_members do |t|
      t.string :name
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end

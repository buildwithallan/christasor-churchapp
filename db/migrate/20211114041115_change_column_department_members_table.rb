class ChangeColumnDepartmentMembersTable < ActiveRecord::Migration[6.1]
  def change
  	change_column :department_members, :department_id, :integer
  end
end

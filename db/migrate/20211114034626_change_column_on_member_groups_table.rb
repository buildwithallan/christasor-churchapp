class ChangeColumnOnMemberGroupsTable < ActiveRecord::Migration[6.1]
  def change
  	change_column :member_groups, :group_id, :integer
  end
end

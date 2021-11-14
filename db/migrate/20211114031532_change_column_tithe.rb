class ChangeColumnTithe < ActiveRecord::Migration[6.1]
  def change
  	change_column :tithes, :membership_id, :integer
  end
end

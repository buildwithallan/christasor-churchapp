class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
  	change_column :pledges, :amount, :decimal
  end
end

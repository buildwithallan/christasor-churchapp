class ChangeColumnOnExpensesTable < ActiveRecord::Migration[6.1]
  def change
  	change_column :expenses, :amount, :decimal
  end
end

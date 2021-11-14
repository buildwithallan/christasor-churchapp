class ChangeColumnOnIncomesTable < ActiveRecord::Migration[6.1]
  def change
  	change_column :incomes, :totaltithe, :decimal
  	change_column :incomes, :totaloffertory, :decimal
  	change_column :incomes, :totalcontribution, :decimal
  	change_column :incomes, :totalpledge, :decimal
  end
end

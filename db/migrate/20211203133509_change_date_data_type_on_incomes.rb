class ChangeDateDataTypeOnIncomes < ActiveRecord::Migration[6.1]
  def change
  	change_column :incomes, :month_year, :string
  end
end

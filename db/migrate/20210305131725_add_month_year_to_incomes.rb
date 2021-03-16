class AddMonthYearToIncomes < ActiveRecord::Migration[6.0]
  def change
    add_column :incomes, :month_year, :string
  end
end

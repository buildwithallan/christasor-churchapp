class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.text :purpose
      t.float :amount
      t.datetime :expense_date

      t.timestamps
    end
  end
end

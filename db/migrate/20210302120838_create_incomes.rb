class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.float :totaltithe
      t.float :totaloffertory
      t.float :totalcontribution
      t.float :totalpledge

      t.timestamps
    end
  end
end

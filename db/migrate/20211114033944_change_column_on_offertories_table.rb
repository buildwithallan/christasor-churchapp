class ChangeColumnOnOffertoriesTable < ActiveRecord::Migration[6.1]
  def change
  	change_column :offertories, :amount, :decimal
  end
end

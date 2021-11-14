class ChangeColumnContributionsTable < ActiveRecord::Migration[6.1]
  def change
  	change_column :contributions, :amount, :decimal
  end
end

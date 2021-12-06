class AddPledgeDateToPledges < ActiveRecord::Migration[6.1]
  def change
    add_column :pledges, :pledge_date, :datetime
  end
end

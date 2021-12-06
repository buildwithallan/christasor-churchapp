class AddOffertoryDateToOffertories < ActiveRecord::Migration[6.1]
  def change
    add_column :offertories, :offertory_date, :datetime
  end
end

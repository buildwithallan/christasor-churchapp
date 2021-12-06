class AddTitheDateToTithes < ActiveRecord::Migration[6.1]
  def change
    add_column :tithes, :tithe_date, :datetime
  end
end

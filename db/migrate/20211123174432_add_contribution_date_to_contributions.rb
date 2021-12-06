class AddContributionDateToContributions < ActiveRecord::Migration[6.1]
  def change
    add_column :contributions, :contribution_date, :datetime
  end
end

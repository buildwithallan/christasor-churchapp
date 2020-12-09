class AddPositionToMemberships < ActiveRecord::Migration[6.0]
  def change
    add_column :memberships, :position, :string
  end
end

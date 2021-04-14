class AddSlugToMemberships < ActiveRecord::Migration[6.0]
  def change
    add_column :memberships, :slug, :string
    add_index :memberships, :slug, unique: true
  end
end

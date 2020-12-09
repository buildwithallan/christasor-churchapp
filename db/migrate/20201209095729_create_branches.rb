class CreateBranches < ActiveRecord::Migration[6.0]
  def change
    create_table :branches do |t|
      t.string :country
      t.string :district
      t.string :location
      t.string :branchname
      t.string :leaders_name
      t.integer :contact1
      t.integer :contact2
      t.integer :contact3

      t.timestamps
    end
  end
end

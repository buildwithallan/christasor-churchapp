class CreateMemberGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :member_groups do |t|
      t.string :fullname
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end

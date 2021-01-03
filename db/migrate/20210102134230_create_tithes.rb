class CreateTithes < ActiveRecord::Migration[6.0]
  def change
    create_table :tithes do |t|
      t.references :membership, null: false, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end

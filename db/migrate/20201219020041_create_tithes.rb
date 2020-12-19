class CreateTithes < ActiveRecord::Migration[6.0]
  def change
    create_table :tithes do |t|
      t.integer :amount

      t.timestamps
    end
  end
end

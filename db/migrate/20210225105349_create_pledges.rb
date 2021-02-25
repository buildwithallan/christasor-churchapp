class CreatePledges < ActiveRecord::Migration[6.0]
  def change
    create_table :pledges do |t|
      t.string :membername
      t.float :amount
      t.string :payment
      t.text :remarks

      t.timestamps
    end
  end
end

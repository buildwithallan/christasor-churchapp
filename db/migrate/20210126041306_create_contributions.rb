class CreateContributions < ActiveRecord::Migration[6.0]
  def change
    create_table :contributions do |t|
      t.string :name
      t.float :amount
      t.string :purpose

      t.timestamps
    end
  end
end

class CreateOffertories < ActiveRecord::Migration[6.0]
  def change
    create_table :offertories do |t|
      t.float :amount
      t.text :description

      t.timestamps
    end
  end
end

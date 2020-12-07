class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.string :member_id
      t.string :title
      t.string :firstname
      t.string :lastname
      t.string :othernames
      t.string :gender
      t.date :date_of_birth
      t.integer :primary_phone_number
      t.integer :other_phone_number
      t.string :email
      t.string :hometown
      t.string :residential_location
      t.string :occupation
      t.string :marital_status
      t.string :work_place
      t.integer :year_joining_church

      t.timestamps
    end
  end
end

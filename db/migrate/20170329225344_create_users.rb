class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :f_name
      t.string :l_name
      t.string :email
      t.string :password_digest
      t.string :street_num
      t.string :street
      t.string :city
      t.string :state
      t.string :zipCode
      t.string :phone
      t.date :bday

      t.timestamps
    end
  end
end

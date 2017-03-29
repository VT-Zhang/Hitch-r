class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :dStreetNum
      t.string :dStreet
      t.string :dCity
      t.string :dState
      t.string :dZip
      t.string :aStreetNum
      t.string :aStreet
      t.string :aCity
      t.string :aState
      t.string :aZip
      t.datetime :dDate
      t.datetime :aDate
      t.time :duration
      t.float :price
      t.references :car, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.integer :owner_id
      t.integer :year
      t.string :make
      t.string :model
      t.integer :miles
      t.string :license_plate
      t.integer :rating
      t.string :bike_name
      t.string :category

      t.timestamps
    end
  end
end

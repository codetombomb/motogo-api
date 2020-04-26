class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :owner_id
      t.integer :bike_id
      t.integer :price_per_day
      t.text :description

      t.timestamps
    end
  end
end

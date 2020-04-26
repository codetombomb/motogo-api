class CreateRenterPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :renter_posts do |t|
      t.integer :renter_id
      t.integer :post_id
      t.string :status

      t.timestamps
    end
  end
end

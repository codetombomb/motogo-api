class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end

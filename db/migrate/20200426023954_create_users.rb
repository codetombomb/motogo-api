class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code
      t.float :latitude
      t.float :longitude
      t.string :phone_number
      t.string :avatar_url

      t.timestamps
    end
  end
end

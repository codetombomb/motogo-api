class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.float :lat
      t.float :lon
      t.string :phone_number
      t.string :avatar_url
      t.string :ip_address
      t.timestamps
    end
  end
end

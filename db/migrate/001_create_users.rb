class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :phone_number
      t.string :address_line_1
      t.string :address_line_2
      t.string :zipcode
      t.string :state
      t.string :country
      t.string :password_digest
      t.string :avatar_url
      
      t.timestamps
    end
  end
end

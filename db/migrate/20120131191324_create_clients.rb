class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :firstname
      t.string :lastname
      t.string :street
      t.string :house_number
      t.string :zip_code
      t.string :city
      t.string :fon
      t.string :mobil
      t.string :email
      t.string :nationality
      t.string :spoken_language

      t.timestamps
    end
  end
end

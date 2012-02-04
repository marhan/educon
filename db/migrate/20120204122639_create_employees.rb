class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :house_number
      t.string :zip_code
      t.string :city
      t.string :fon
      t.string :mobil_fon
      t.string :email

      t.timestamps
    end
  end
end

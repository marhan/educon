class AddPersonalDataToUsers < ActiveRecord::Migration
  change_table :users do |t|
    t.string :first_name, :last_name, :street, :house_number
    t.string :zip_code, :city, :phone, :mobile_phone
  end
end

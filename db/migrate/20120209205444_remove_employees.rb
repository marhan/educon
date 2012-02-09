class RemoveEmployees < ActiveRecord::Migration
  def up
    drop_table :employees
  end

  def down
    create_table "employees", :force => true do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "street"
      t.string "house_number"
      t.string "zip_code"
      t.string "city"
      t.string "phone"
      t.string "mobile_phone"
      t.string "email"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end

class ChangeAttributesOfEmployee < ActiveRecord::Migration
  change_table :employees do |t|
    t.rename :fon, :phone
    t.rename :mobil_fon, :mobile_phone
  end
end

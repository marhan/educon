class ChangeAttributesOfEmployee < ActiveRecord::Migration
  def up
    change_table :employees do |t|
      t.rename :fon, :phone
      t.rename :mobil_fon, :mobile_phone
    end
  end

  def down
    change_table :employees do |t|
      t.rename :phone, :fon
      t.rename :mobile_phone, :mobil_fon
    end
  end
end

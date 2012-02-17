class AddEmployeeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :employee, :boolean, :default => 1
  end
end

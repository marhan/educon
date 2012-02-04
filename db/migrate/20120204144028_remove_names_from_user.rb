class RemoveNamesFromUser < ActiveRecord::Migration

  change_table :users do |t|
    t.remove :firstname, :lastname
  end

end

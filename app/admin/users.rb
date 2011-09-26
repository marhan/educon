ActiveAdmin.register User do

  filter :firstname
  filter :lastname
  filter :email
  filter :created_at

  index do
    id_column
    column :firstname
    column :lastname
    column :email
    column :created_at
    default_actions
  end

  form do |f|
    f.inputs "Editable Details" do
      f.input :firstname
      f.input :lastname
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.buttons
    end
  end

end

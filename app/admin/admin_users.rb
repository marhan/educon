ActiveAdmin.register AdminUser do

  filter :email
  filter :created_at

  index do
    id_column
    column :email
    column :last_sign_in_at
    column :created_at
    default_actions
  end

  form do |f|
    f.inputs "Editable Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.buttons
    end
  end

end

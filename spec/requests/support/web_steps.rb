def user_asks_for_password_forgotten_email email
  find("#topbar").find_link("Passwort vergessen").click
  find('#page_title').should have_content('Passwort vergessen')
  within_fieldset('fieldset_password_forgotten') do
    fill_in('field_email', :with => email)
  end
  click_button 'Email mit Anweisungen senden'
end

def user_fills_password_reset_with(new_password)
  within_fieldset('fieldset_password_reset') do
    fill_in('field_password', :with => new_password)
    fill_in('field_password_confirmation', :with => new_password)
  end
  click_button('Speichern')
end
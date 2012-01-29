def user_ask_for_password_forgotten_email email
  find("#topbar").find_link("Passwort vergessen").click
  find('#page_title').should have_content('Passwort vergessen')
  within_fieldset('fieldset_password_forgotten') do
    fill_in('field_email', :with => email)
  end
  click_button 'Email mit Anweisungen senden'
end
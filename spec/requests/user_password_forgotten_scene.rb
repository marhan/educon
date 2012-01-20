# encoding: utf-8
require 'requests/spec_helper'
require 'requests/support/request_macros'

describe "Given User is not singed in" do

  before(:each) do
    # clear email cache
    ActionMailer::Base.deliveries.clear
    #
    @user = FactoryGirl.create(:user)
  end

  describe "and goes to the password forgotten page," do

    before(:each) do
      visit '/'
      click_link("Passwort vergessen")
      find('#page_title').should have_content('Passwort vergessen')
    end

    describe "when the user enters his email address," do

      before(:each) do
        within_fieldset('fieldset_password_forgotten') do
          fill_in('field_email', :with => @user.email)
        end
      end

      describe "and click button 'Email mit Anweisungen senden'," do

        before(:each) do
          click_button 'Email mit Anweisungen senden'
        end

        it "than an email with Password forgotten instructions is send to him" do
          ActionMailer::Base.deliveries.should_not be_empty
          email = ActionMailer::Base.deliveries.first
          email.should_not be_nil

          email.should deliver_to(@user.email)
          email.subject.should eq("Anleitung um das Passwort neu zu setzen")
          email.should have_subject(/Anleitung um das Passwort neu zu setzen/)
        end
      end

      describe "and click button 'Zurücksetzen'," do

        before(:each) do
          click_button 'Zurücksetzen'
        end

        it "than the form is resetted" do
          find('#fieldset_password_forgotten').find_field('field_email').value.should == ""
        end

         it "than no no email with Password forgotten instructions is send" do
          ActionMailer::Base.deliveries.should be_empty
        end

      end

    end

  end

end
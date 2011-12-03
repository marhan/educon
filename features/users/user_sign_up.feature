Feature: User sign up
  In order to get access to protected sections of the site
  As a user
  I want to be able to sign up

    Background:
      Given I am not signed in
      And I am on the home page
      And I go to the users sign up page
      
    Scenario: User signs up with valid data
      And I fill in the following:
        | Firstname             | Testy           |
        | Lastname              | McUserton       |
        | Email                 | user@test.com   |
        | Password              | please          |
        | Password confirmation | please          |
      And I press "Register"
      Then I should see "Welcome! You have signed up successfully." 
      
    Scenario: User signs up with invalid email
      And I fill in the following:
        | Firstname             | Testy           |
        | Lastname              | McUserton       |
        | Email                 | invalidemail    |
        | Password              | please          |
        | Password confirmation | please          |
      And I press "Register"
      Then I should see "Email is invalid"

    Scenario: User signs up without password
      And I fill in the following:
        | Firstname             | Testy           |
        | Lastname              | McUserton       |
        | Email                 | user@test.com   |
        | Password              |                 |
        | Password confirmation | please          |
      And I press "Register"
      Then I should see "Password can't be blank"

    Scenario: User signs up without password confirmation
      And I fill in the following:
        | Firstname             | Testy           |
        | Lastname              | McUserton       |
        | Email                 | user@test.com   |
        | Password              | please          |
        | Password confirmation |                 |
      And I press "Register"
      Then I should see "Password doesn't match confirmation"

    Scenario: User signs up with mismatched password and confirmation
      And I fill in the following:
        | Firstname             | Testy           |
        | Lastname              | McUserton       |
        | Email                 | user@test.com   |
        | Password              | please          |
        | Password confirmation | please1         |
      And I press "Register"
      Then I should see "Password doesn't match confirmation"

Feature: Admin sign in
  In order to get access to protected sections of the site
  A admin
  Should be able to sign in

  Scenario: Not signed up admin is not able to sign in
    Given I am not signed in into administration interface
    And No admin exists with an email of "admin@wrong.com"
    When I go to the admins sign in page
    And I sign in as admin with "admin@wrong.com/please"
    Then I should see "Invalid email or password."
    And As admin i should be signed out

  Scenario: Admin enters wrong password while sign in
    Given I am not signed in into administration interface
    And I am an admin with an email "admin@test.com" and password "please"
    When I go to the admins sign in page
    And I sign in as admin with "admin@test.com/wrongpassword"
    Then I should see "Invalid email or password."
    And I go to the admins dashboard
    And As admin i should be signed out

  Scenario: Admin signs in successfully
    Given I am not signed in into administration interface
    And I am an admin with an email "admin@test.com" and password "please"
    When I go to the admins sign in page
    And I sign in as admin with "admin@test.com/please"
    Then I should be signed in as admin "admin@test.com"
    And I should see "Signed in successfully."

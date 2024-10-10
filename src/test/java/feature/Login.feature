Feature: Login feature

  Background:
    Given User should be on the login screen

  @sanity @login
  Scenario: User should be able to login with valid credentials
    When User enter valid username and password
    And User click on the login button
    Then User should be navigate to the inventory page
    But User should not be on the login page

  @login
  Scenario: User should not be able to login with an invalid password
    When User enter "standard_user" on the username field
    And User enter "secret_s" on the password field
    And User click on the login button
    Then User should see "Epic sadface: Username and password do not match any user in this service" error message

  Scenario: User should not be able to login without username
    When User enter "secret_sauce" on the password field
    And User click on the login button
    Then User should see "Epic sadface: Username is required" error message

  Scenario: User should not be able to login without password
    When User enter "standard_user" on the username field
    And User click on the login button
    Then User should see "Epic sadface: Password is required" error message

  Scenario: User should not be able to login without username and password
    When User click on the login button
    Then User should see "Epic sadface: Username is required" error message

  Scenario Outline: User should not be to login with invalid credentials
    When User enter <username> on the username field
    And User enter <password> on the password field
    And User click on the login button
    Then User should see <error_msg> error message
    Examples:
      | username      | password     | error_msg                                                                 |
      |"standard_user"|"secred_s"    |"Epic sadface: Username and password do not match any user in this service"|
      |""             |"secret_sauce"|"Epic sadface: Username is required"                                       |
      |"standard_user"|""            |"Epic sadface: Password is required"                                       |
      |""             |""            |"Epic sadface: Username is required"                                       |

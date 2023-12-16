Feature: 
    As a registered user
    I want to log into my account 
    So that I can access my classmate connect application.

Scenario: Successful login
    Given I am on login page
    When I enter my valid username and password
    And I press "Login" 
    And I should see a welcome message

Scenario: Unsuccessful login with missing credentials
    Given I am on login page
    When I leave password fields blank
    And I press "submit"
    Then I am on page login

Scenario: Unsuccessful login with invalid credentials
    Given I am on login page
    When I enter my invalid username and password
    And I press "Login"
    Then I am on page login
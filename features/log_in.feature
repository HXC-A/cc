Feature: display list of movies filtered by MPAA rating

    As a registered user
    I want to log into my account 
    So that I can access my classmate connect application.

Scenario: Successful login
    Given I am on login page
    When I enter my valid username and password
    And I click the "Log In" button
    Then I am on the classmate connect home page

Scenario: Unsuccessful login with missing credentials
    Given I am on login page
    When I leave password fields blank
    And I click the "Log In" button
    Then I am on the login page

Scenario: Unsuccessful login with invalid credentials
    Given I am on login page
    When I enter my invalid username and password
    And I click the "Log In" button
    Then I am on the login page
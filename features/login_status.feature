Feature: Display Login Status on Web Page
    As a website user
    I want to see my login status
    I need a message to show my login success

Scenario: User logs in
    Given I am a registered user
    Given I am on login page
    When I log in with valid credentials
    And I press "Login" 
    And I should see a welcome message

Scenario: User logs out
    Given a registered user
    Given I am on login page
    When I enter my valid username and password
    And I press "Login"
    And I should see a welcome message
    When I click on the exit link
    Then I should see a exit messgae
    
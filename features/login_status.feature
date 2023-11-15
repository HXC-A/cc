Feature: Display Login Status on Web Page
    As a website user
    I want to see my login status
    I need a message to show my login success

Scenario: User logs in
    Given I am a registered user
    And I am on the home page
    When I log in with valid credentials
    Then I should see a "Login Success" message


Scenario: User logs out
    Given I am a logged-in user
    When I click the "Logout" button
    Then I should see a "Goodbye" message
    
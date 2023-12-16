Feature: Visit Messages
    As a registered user
    I want to visit messages

Scenario: Not logged in
    Given I am on the home page
    And I click on "Messages" in the "portal"
    Then I am redirected to the login page

Scenario: Successful login and enter message page
    Given a registered user
    Given I am on login page
    When I enter my valid username and password
    And I press "Login"
    And I should see a welcome message
    And I click on "Messages" in the "navbar"
    And I should see a list of inbox messages
    When I click on "Outbox"
    And I should see a list of outbox messages
    When I click on "Inbox"
    And I should see a list of inbox messages
    When I click on "Create Message"
    Then I am redirected to the send message page

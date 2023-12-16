Feature: Send and Receive Messages
    As a registered user
    I want to send and receive messages
    So that I can communicate with my friends

Scenario: Successful send message
    Given two registered user
    Given I am on login page
    When I enter my valid username and password
    And I press "Login"
    And I should see a welcome message
    And I click on "Messages" in the "portal"
    And I should see a list of inbox messages
    When I click on "Create Message"
    Then I am redirected to the send message page
    And I fill in the message fields
    And I press "Send"
    And I should see a success message
    When I click on "Outbox"
    And I should see a list of outbox messages containing sented messages

Scenario: Unsuccessful send message with error received
    Given two registered user
    Given I am on login page
    When I enter my valid username and password
    And I press "Login"
    And I should see a welcome message
    And I click on "Messages" in the "navbar"
    And I should see a list of inbox messages
    When I click on "Create Message"
    Then I am redirected to the send message page
    And I fill in the error received message fields
    And I press "Send"
    And I should still in send message page

Scenario: Unsuccessful send message with missing fields
    Given two registered user
    Given I am on login page
    When I enter my valid username and password
    And I press "Login"
    And I should see a welcome message
    And I click on "Messages" in the "navbar"
    And I should see a list of inbox messages
    When I click on "Create Message"
    Then I am redirected to the send message page
    And I fill in the missing fields
    And I press "Send"
    And I should still in send message page

Scenario: Receive message
    Given two registered user
    Given a unread messages
    Given I am on login page
    When I enter my valid username and password
    And I press "Login"
    And I should see a welcome message
    And I click on "Messages" in the "navbar"
    And I should see a list of inbox messages
    When I click on "Inbox"
    And I should see a list of inbox messages containing received messages
    When I click on "more info"
    And I should enter message show page
    And I should see 'From'
    And I should see 'To'
    And The message should be have read

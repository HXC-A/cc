Feature:
    I want to register an account
    So that I can access my classmate connect application.

Scenario: Successful signup
    Given I am on register page
    When I fill in username and password
    And I press "Registration"
    And I should redirected to the login page
    And I should see sign up success message

Scenario: Unsuccessful signup with missing fields
    Given I am on register page
    When I fill in only username
    And I press "Registration"
    Then I am on page register

Scenario: Unsuccessful signup with non-Columbia email
    Given I am on register page
    When I fill in username, non-Columbia email, and password
    And I press "Registration"
    Then I should see an error message about Columbia email

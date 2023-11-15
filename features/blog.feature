Feature: Manage Blog Section
    As a website user
    I want to upload and manage my blogs
    So that I can share my thoughts and experiences

Scenario: User navigates to the blog section
    Given I am a registered user
    When I visit the blog section
    Then I should see a "Create New Blog" button

Scenario: User uploads a new blog
    Given I am a registered user
    And I am on the blog creation page
    When I fill in the blog title with "My First Blog"
    And I write the blog content
    And I click the "Publish" button
    Then I should see a blog upload success message
    And my new blog should be visible on the blog list

Scenario: User edits an existing blog
    Given I am a registered user
    And I have an existing blog titled "My First Blog"
    When I edit the blog content
    And I click the "Update" button
    Then I should see a blog upload success message
    And the changes to the blog should be visible on the blog list

Scenario: User deletes an existing blog
    Given I am a registered user
    And I have an existing blog titled "My First Blog"
    When I navigate to the blog details page
    And I click the "Delete" button
    Then I should see a confirmation message
    And my blog should be removed from the blog list

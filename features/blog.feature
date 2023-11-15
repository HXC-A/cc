Feature: Manage Blog Section
    As a website user
    I want to upload and manage my blogs
    So that I can share my thoughts and experiences

Scenario: User navigates to the blog section
    Given I am a registered user for Blog
    When I visit the blog section
    Then I should see a "Create a blog" button

Scenario: User uploads a new blog
    Given I am a registered user for Blog
    And I am on the blog creation page
    When I fill in the blog title with "My First Blog"
    And I write the blog content
    And I click the Save button
    And my new blog should be visible on the blog list

Scenario: User edits an existing blog
    Given I am a registered user for Blog
    And I am on the blog creation page
    When I fill in the blog title with "My First Blog"
    And I write the blog content
    And I click the Save button
    And my new blog should be visible on the blog list
    When I edit the blog content
    When I fill in the blog title with "My edited Blog"
    And I click the Save button
    And the changes to the blog should be visible on the blog list
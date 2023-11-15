# features/step_definitions/blog_steps.rb

Given("I am a registered user") do
  # Assume registration logic here
  @registered_user = true
end

When("I visit the blog section") do
  visit '/blogs'
end

When("I am on the blog creation page") do
  visit '/blogs/new'
end

When("I fill in the blog title with {string}") do |blog_title|
  fill_in 'blog_title', with: blog_title
end

When("I write the blog content") do
  fill_in 'blog_content', with: 'This is the content of my blog.'
end

When("I click the {string} button") do |button_text|
  click_button(button_text)
end

Then("I should see a blog upload success message here") do
  expect(page).to have_content('Blog created successfully!')
end

Then("my new blog should be visible on the blog list") do
  expect(page).to have_content('My First Blog')
end

When("I edit the blog content") do
  visit '/blogs/1/edit'
  fill_in 'blog_content', with: 'Updated content of my blog.'
end

Then("the changes to the blog should be visible on the blog list") do
  visit '/blogs'
  expect(page).to have_content('Updated content of my blog.')
end

When("I navigate to the blog details page") do
  visit '/blogs/1'
end

Then("I should see a confirmation message") do
  expect(page).to have_content('Are you sure you want to delete this blog?')
end

Then("my blog should be removed from the blog list") do
  visit '/blogs'
  expect(page).not_to have_content('Updated content of my blog.')
end

# features/step_definitions/blog_steps.rb

Given("I am a registered user for Blog") do
  @user = User.create!(username: "test@example.com", password: "password")

  visit '/sessions/new'

  fill_in 'form_username', with: @user.username
  fill_in 'form_password', with: 'password'

  click_button 'submit'
end

When("I visit the blog section") do
  visit '/blogs'
end

When("I am on the blog creation page") do
  visit '/blogs/new'
end

When("I fill in the blog title with {string}") do |blog_title|
  fill_in 'blog[title]', with: blog_title
end

When("I write the blog content") do
  fill_in 'blog_content', with: 'This is the content of my blog.'
end

When("I click the Save button") do 
  click_button 'commit'
end

Then("my new blog should be visible on the blog list") do
  expect(page).to have_content('My First Blog')
end

When("I edit the blog content") do
  visit '/blogs/1/edit'
  fill_in 'blog_content', with: 'Updated content of my blog.'
end

Then("the changes to the blog should be visible on the blog list") do

  expect(page).to have_content('My edited Blog')
end

Then("I should see a {string} button") do |button_text|
  expect(page).to have_link(button_text, href: '/blogs/new')
end


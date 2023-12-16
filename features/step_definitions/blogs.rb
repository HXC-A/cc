# features/step_definitions/blog_steps.rb

Given("I am a registered user for Blog") do
  @user = User.create!(username: "testuser", email: "test@columbia.edu", password: "password")

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

When(/^I fill in the tags with "(.*?)"$/) do |tags|
  fill_in 'blog[tags_string]', with: tags
end

Then(/^the blog should have tags "(.*?)"$/) do |tags|
  tags.split(', ').each do |tag|
    expect(page).to have_content(tag)
  end
end

Then(/^I should see a error "(.*?)"$/) do |message|
  expect(page).to have_content(message)
end

Then(/^I should be on the blog creation page$/) do
  expect(current_path).to eq new_blog_path 
end

When(/^I fill in the blog content with "(.*?)"$/) do |content|
  fill_in 'Content', with: content 
end


When('I click on the blog post titled {string}') do |string|
  click_on string
end

Then(/^I should see "(.*?)" as the blog title$/) do |title|
  expect(page).to have_content(title)
end

When("I edit the blog content to empty") do
  visit '/blogs/1/edit'
  fill_in 'blog_content', with: ''
end
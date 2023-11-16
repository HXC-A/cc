require 'uri'
# require 'cgi'
# require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
# require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))



# Given /^(?:|I )am on (.+)$/ do |page_name|
#     visit path_to(page_name)
# end
Given("I am on login page") do
    visit '/sessions/new' 
end

And("I should see a welcome message") do
    # puts page.body
    expect(page).to have_content('ClassmateConnect')
end

Then ("I am on page home") do
    expected_path = '/sessions'
    assert_equal(expected_path, current_path)
end

When("I enter my valid username and password") do
    fill_in 'username', with: 'weiran'
    fill_in 'password', with: '123456'
end

When("I enter my invalid username and password") do
    fill_in 'username', with: 'weiran'
    fill_in 'password', with: '12341357956'
end

When ("I leave password fields blank") do
    fill_in 'username', with: 'weiran'
    fill_in 'password', with: ''
end

And /^(?:|I )press "([^"]*)"$/ do |button|
    click_button(button)
end

Then ("I am on page login") do
    # expected_path = '/sessions/new'
    # puts "Debug"
    # puts current_path
    expect(page).to have_content('User Login')
end

When('I click on the exit link') do
    # puts page.body
    click_link("exit")
end

Then ("I should see a exit messgae") do
    expect(page).to have_content('Exit Successfully')
end

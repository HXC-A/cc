Given('I am on register page') do
  visit new_user_path
end

When('I fill in username and password') do
  fill_in 'user[username]', with: 'weiran'
  fill_in 'user[password]', with: '123456'
end

When('I should redirected to the login page') do
  expect(page).to have_content('User Login')
end

When('I fill in only username') do
  fill_in 'user[username]', with: 'weiran'
end

Then('I am on page register') do
  expect(page).to have_content('User Registration')
end

When('I should see sign up success message') do
  expect(page).to have_content('Registration successful! Please log in')
end

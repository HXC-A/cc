Given('a registered user') do
  @user = User.create!(username: 'user', password: '123456')
end

Given('I am on the home page') do
  visit '/'
end

Given('I click on {string}') do |string|
  click_on string
end

Then('I am redirected to the login page') do
  expect(page).to have_content('User Login')
end

When('I should see a list of inbox messages') do
  expect(page).to have_content('Create Message')
  expect(page).to have_content('Message')
  expect(page).to have_content('ID')
  expect(page).to have_content('Sender')
  expect(page).to have_content('Content')
end

When('I should see a list of outbox messages') do
  expect(page).to have_content('Create Message')
  expect(page).to have_content('Message')
  expect(page).to have_content('ID')
  expect(page).to have_content('Recipient')
  expect(page).to have_content('Content')
end

Then('I am redirected to the send message page') do
  expect(page).to have_content('Create Message')
end

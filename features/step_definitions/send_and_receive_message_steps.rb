Given('two registered user') do
  @user1 = User.create!(username: 'weiran', email: "weiran@columbia.edu", password: '123456')
  @user2 = User.create!(username: 'weiran2', email: "weiran2@columbia.edu", password: '123456')
end

Then('I fill in the message fields') do
  fill_in'message[receiver_username]', with: 'weiran2'
  fill_in'message[content]', with: 'Hello World'
end

Then('I should see a success message') do
  expect(page).to have_content('Sent successfully')
end

When('I should see a list of outbox messages containing sented messages') do
  expect(page).to have_content('Hello World')
  expect(page).to have_content('weiran2')
end

Then('I fill in the error received message fields') do
  fill_in'message[receiver_username]', with: 'no_user'
  fill_in'message[content]', with: 'Hello World'
end

Then('I should still in send message page') do
  expect(page).to have_content('Create Message')
end

Given('a unread messages') do
  @message = Message.create!(sender_id: @user2.id, receiver_id: @user1.id, content: "Hello World")
end

When('I should see a list of inbox messages containing received messages') do
  expect(page).to have_content("Hello World")
  expect(page).to have_content(@user2.username)
end

When('I should enter message show page') do
  expect(page).to have_content("Hello World")
end

When('I should see {string}') do |string|
  expect(page).to have_content(string)
end

When('The message should be have read') do
  expect(@message.reload.is_read).to be true
end

Then('I fill in the missing fields') do
  fill_in'message[receiver_username]', with: ''
  fill_in'message[content]', with: ''
end

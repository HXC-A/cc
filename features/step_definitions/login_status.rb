
# features/step_definitions/login_status.rb

Given("I am a registered user") do
  # Assume registration logic here
  @registered_user = true
end

Given("I am on home page") do
  visit '/'
end

When("I visit the home page") do
  visit '/'
end

When("I log in with valid credentials") do
  # Assume login logic here
  @user_logged_in = true
  @username = "weiran"  
end

Then("I should see login success") do 
  expect(page).to have_content('Login success')
end



FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "valid_user_#{n}_#{Time.now.to_i}" }
    password { 'secure_password' }
  end

  factory :invalid_user, parent: :user do
    username { nil }
  end
end
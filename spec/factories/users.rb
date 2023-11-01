FactoryBot.define do
    factory :user do
      username { 'valid_user' }
      password { 'secure_password' }
    end

    factory :invalid_user, parent: :user do
        username { nil }
      end
  end
FactoryBot.define do
    factory :message do
      association :sender, factory: :user
      association :receiver, factory: :user
      content { "Test message content" }
    end
  end
  
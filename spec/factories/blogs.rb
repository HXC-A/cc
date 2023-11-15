FactoryBot.define do
    factory :blog do
      title { "Sample Blog Title" }
      content { "Sample blog content." }
      is_public { true }
      user
      # Add other attributes as needed
    end
  end
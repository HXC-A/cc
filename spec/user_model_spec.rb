require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { create(:user) }  # Assuming you have a user factory

    it 'validates presence of username' do
      user = build(:user, username: nil)
      expect(user).not_to be_valid
      expect(user.errors[:username]).to include("Username can not be empty")
    end

    it 'validates uniqueness of username' do
      duplicate_user = build(:user, username: subject.username)
      expect(duplicate_user).not_to be_valid
      expect(duplicate_user.errors[:username]).to include("Username already exists")
    end

    it 'validates presence of password' do
      user = build(:user, password: nil)
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("Password can not be blank")
    end

    it 'validates length of password' do
      user = build(:user, password: '12345')
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("The minimum password length is 6 characters")
    end
  end

  describe 'associations' do
    it { should have_many(:blogs) }
    it { should have_many(:public_blogs).class_name('Blog').conditions(is_public: true) }
    it { should have_many(:inboxes).class_name('Message').with_foreign_key('receiver_id') }
    it { should have_many(:outboxes).class_name('Message').with_foreign_key('sender_id') }
  end
end

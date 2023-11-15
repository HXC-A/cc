require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'validations' do
    subject { create(:tag) }  # Assuming you have a tag factory
    let(:tag) { build(:tag, title: subject.title) }

    it 'validates uniqueness of title' do
      expect(tag).not_to be_valid
      expect(tag.errors[:title]).to include("Tag already exists")
    end
  end

  describe 'associations' do
    it { should have_many(:blogs_tags).class_name('BlogsTags') }
    it { should have_many(:blogs).through(:blogs_tags) }
  end
end

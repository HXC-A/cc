require 'rails_helper'

RSpec.describe BlogsTags, type: :model do
    describe 'validations' do
      subject { create(:blogs_tags) }
      let(:blog) { create(:blog) }
      let(:tag) { create(:tag) }
  
      it 'validates uniqueness of blog_id scoped to tag_id' do
        create(:blogs_tags, blog: blog, tag: tag)
        duplicate = build(:blogs_tags, blog: blog, tag: tag)
        duplicate.valid?
        expect(duplicate.errors[:blog_id]).to include("has already been taken")
      end
    end
  
    describe 'associations' do
      it { should belong_to(:blog) }
      it { should belong_to(:tag) }
    end
end
  

require 'rails_helper'

RSpec.describe Blog, type: :model do
  describe 'validations' do
    it 'validates presence of title' do
      blog = Blog.new(title: nil)
      blog.valid?
      expect(blog.errors[:title]).to include("The title can not be blank")
    end

    it 'validates presence of content' do
      blog = Blog.new(content: nil)
      blog.valid?
      expect(blog.errors[:content]).to include("The content can not be blank")
    end

    it 'validates presence of user_id' do
      blog = Blog.new(user_id: nil)
      blog.valid?
      expect(blog.errors[:user_id]).to include("The user cannot be empty")
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:blogs_tags) }
    it { should have_many(:tags).through(:blogs_tags) }
  end

  describe '#tags_string=' do
    let(:blog) { create(:blog) }

    it 'assigns tags to the blog' do
        blog.tags_string = "tag1,tag2"
        expect(blog.tags.map(&:title)).to contain_exactly('tag1', 'tag2')
    end

    it 'creates new tags if they do not exist' do
        expect { blog.tags_string = "newtag" }.to change(Tag, :count).by(1)
    end

    it 'reuses existing tags' do
        create(:tag, title: 'existingtag')
        expect { blog.tags_string = "existingtag" }.not_to change(Tag, :count)
    end
  end
end

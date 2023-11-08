class Blog < ApplicationRecord

    validates :title, presence: { message: "The title can not be blank" }
    validates :content, presence: { message: "The content can not be blank" }
    validates :user_id, presence: { message: "The user cannot be empty" }

    belongs_to :user
    has_many :blogs_tags, class_name: "BlogsTags"
    has_many :tags, through: :blogs_tags

    def tags_string= one_tags
        self.tags.destroy_all
        
        one_tags.split(',').each do |tag|
          one_tag = Tag.find_by(title: tag)
          one_tag = Tag.new(title: tag) unless one_tag
    
          self.tags << one_tag
        end
    end

end

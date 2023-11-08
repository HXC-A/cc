class Blog < ApplicationRecord

    validates :title, presence: { message: "The title can not be blank" }
    validates :content, presence: { message: "The content can not be blank" }
    validates :user_id, presence: { message: "The user cannot be empty" }

    belongs_to :user
    has_many :blogs_tags, class_name: "BlogsTags"
    has_many :tags, through: :blogs_tags

end

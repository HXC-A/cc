class Tag < ApplicationRecord
    validates :title, uniqueness: { message: "Tag already exists" }

    has_many :blogs_tags, class_name: "BlogsTags"
    has_many :blogs, through: :blogs_tags

end

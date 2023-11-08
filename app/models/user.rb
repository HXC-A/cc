class User < ApplicationRecord

    validates :username, presence: { message: "Username can not be empty" }
    validates :username, uniqueness: { message: "Username already exists" }
    validates :password, presence: { message: "Password can not be blank" }
    validates :password, length: { minimum: 6, message: "The minimum password length is 6 characters" }

    has_many :blogs
    has_many :public_blogs, -> { where(is_public: true) },
        class_name: "Blog"
end

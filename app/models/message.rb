class Message < ApplicationRecord
    validates :receiver_id, presence: { message: "Recipient cannot be empty" }
    validates :sender_id, presence: { message: "Sender cannot be empty" }
    validates :content, presence: { message: "Content can not be blank" }

    belongs_to :sender, class_name: :User
    belongs_to :receiver, class_name: :User

    attr_accessor :receiver_username

    validate :validate_username

    def is_read_to_s
        self.is_read ? "Read" : "Unread"  
    end

    def receiver_username= username
        if user = User.find_by(username: username)
            self.receiver = user
        end
    end

    private
    def validate_username
        unless self.receiver
        self.errors.add(:receiver_username, "Recipient does not exist")
        false
        else
        true
        end
    end
end

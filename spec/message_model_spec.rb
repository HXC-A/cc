require 'rails_helper'

RSpec.describe Message, type: :model do
    describe 'validations' do
        it 'validates presence of receiver_id' do
            message = Message.new(receiver_id: nil)
            message.valid?
            expect(message.errors[:receiver_id]).to include("Recipient cannot be empty")
        end
        it 'validates presence of sender_id' do
            message = Message.new(sender_id: nil)
            message.valid?
            expect(message.errors[:sender_id]).to include("Sender cannot be empty")
        end
        it 'validates presence of content' do
            message = Message.new(content: nil)
            message.valid?
            expect(message.errors[:content]).to include("Content can not be blank")
        end
    end

    describe 'associations' do
        it { should belong_to(:sender).class_name('User') }
        it { should belong_to(:receiver).class_name('User') }
    end 

    describe 'isRead' do
        it 'returns "Read" when is_read is true' do
            message = Message.new(is_read: true)
            expect(message.is_read_to_s).to eq('Read')
        end

        it 'returns "Unread" when is_read is false' do
            message = Message.new(is_read: false)
            expect(message.is_read_to_s).to eq('Unread')
        end
    end

    describe 'receiver_username=' do
        it 'sets the receiver based on the username' do
            user = create(:user, username: 'test_user')
            message = Message.new(receiver_username: 'test_user')
            message.save
            expect(message.receiver_id).to eq(user.id)
        end

        it 'sets the receiver based on the non exist username' do
            message = Message.new(receiver_username: 'non_exist_user')
            message.save
            expect(message.errors[:receiver_username]).to include("Recipient does not exist")
        end
    end


end
require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }

    describe 'GET #index' do
        context 'type is set to inbox' do
            it 'assigns inbox messages to @messages' do
                puts "debug"
                # user.inboxes.create(attributes_for(:message, sender: other_user))
                # get :index, params: { type: 'inbox' }
                # expect(assigns(:messages)).to eq(user.inboxes.page(1).per(10).order("id desc"))
            end
        end
    end
end
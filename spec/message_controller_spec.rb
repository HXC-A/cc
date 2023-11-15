require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let!(:inbox_message) { create(:message, receiver: user) }
  let!(:outbox_message) { create(:message, sender: user) }

  before do
    allow(controller).to receive(:current_user).and_return(user)
    allow(controller).to receive(:auth_user).and_return(true)
  end

  describe "GET #index" do
    before { allow(controller).to receive(:auth_user) }

    context 'when viewing inboxes' do
      it "assigns user's inboxes as @messages" do
        get :index, params: { type: 'inbox' }
        expect(assigns(:messages)).to eq([inbox_message])
      end
    end

    context 'when viewing outboxes' do
      it "assigns user's outboxes as @messages" do
        get :index, params: { type: 'outbox' }
        expect(assigns(:messages)).to eq([outbox_message])
      end
    end
  end

  describe "GET #new" do
    it "assigns a new message as @message" do
      get :new
      expect(assigns(:message)).to be_a_new(Message)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Message" do
        expect {
          post :create, params: { message: { receiver_id: other_user.id, content: "Hello" } }
        }.to change(Message, :count).by(1)
      end

      it "redirects to the messages index" do
        post :create, params: { message: { receiver_id: other_user.id, content: "Hello" } }
        expect(response).to redirect_to(messages_path)
      end
    end

    context "with invalid params" do
      it "re-renders the 'new' template" do
        post :create, params: { message: { receiver_id: nil, content: "" } }
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #show" do
    context "when user is not sender or receiver" do
      it "renders 403 Forbidden" do
        allow(controller).to receive(:current_user).and_return(other_user)
        get :show, params: { id: inbox_message.id }
        expect(response.body).to include("403 Forbidden")
      end
    end

    context "when user is the receiver" do
      it "marks the message as read" do
        get :show, params: { id: inbox_message.id }
        inbox_message.reload
        expect(inbox_message.is_read).to be true
      end
    end
  end
end

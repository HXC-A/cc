require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new user' do
        expect do
          post :create, params: { user: { username: 'newuser', email: 'newuser@columbia.edu', password: 'password' } }
        end.to change(User, :count).by(1)
      end

      it 'redirects to the login page' do
        post :create, params: { user: { username: 'newuser', email: 'newuser@columbia.edu', password: 'password' } }
        expect(response).to redirect_to(new_session_path)
      end
    end
    context 'with invalid parameters' do
      it 'does not create a new user' do
        expect do
          post :create, params: { user: { username: '', email: '', password: '' } }
        end.not_to change(User, :count)
      end

      it 're-renders the new template' do
        post :create, params: { user: { username: '', email: '', password: '' } }
        expect(response).to render_template(:new)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the user' do
        expect {
          post :create, params: { user: { username: nil, email: nil, password: nil } }
        }.to_not change(User, :count)
      end
      
      it 're-renders the new template' do
        post :create, params: { user: { username: nil, email: nil, password: nil } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #blogs" do
    let(:user) { create(:user) }

    before do
      allow(controller).to receive(:auth_user).and_return(true)
      allow(controller).to receive(:current_user).and_return(user)
    end

    it "assigns user's blogs as @blogs" do
      blog = create(:blog, user: user)
      get :blogs, params: { id: user.id }
      expect(assigns(:blogs)).to eq([blog])
    end
  end

end

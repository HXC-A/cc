require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    context 'when user is logged in' do
      before do
        session[:user_id] = user.id
        get :index
      end

      it 'assigns @user' do
        expect(assigns(:user)).to eq(user)
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end

    context 'when user is not logged in' do
      before do
        get :index
      end

      it 'assigns @user as nil' do
        expect(assigns(:user)).to be_nil
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end

    context 'with non-existent user_id in session' do
      before do
        session[:user_id] = -1
        get :index
      end
    
      it 'assigns @user as nil' do
        expect(assigns(:user)).to be_nil
      end
    end
  end
end
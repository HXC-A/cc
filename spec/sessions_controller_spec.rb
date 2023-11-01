require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
    let(:user) { create(:user) }
  
    describe 'GET #new' do
      it 'renders the :new template' do
        get :new
        expect(response).to render_template :new
      end
    end
  
    describe 'POST #create' do
    context 'with valid credentials' do
      it 'assigns the user to @user' do
        post :create, params: { username: user.username, password: user.password }
        expect(assigns(:user)).to eq(user)
      end

      it 'logs the user in' do
        post :create, params: { username: user.username, password: user.password }
        expect(session[:user_id]).to eq(user.id)
      end

      it 'redirects to the root path' do
        post :create, params: { username: user.username, password: user.password }
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid credentials' do
      it 'renders the :new template' do
        post :create, params: { username: 'wrong', password: 'wrong' }
        expect(response).to render_template :new
      end

      it 'does not log the user in' do
        post :create, params: { username: 'wrong', password: 'wrong' }
        expect(session[:user_id]).to be_nil
      end
    end

    context 'with invalid credentials' do
        it 'does not set the user_id in session' do
          post :create, params: { username: 'invalid_user', password: 'invalid_password' }
          expect(session[:user_id]).to be_nil
        end
        
        it 'renders the new template' do
          post :create, params: { username: 'invalid_user', password: 'invalid_password' }
          expect(response).to render_template(:new)
        end
    end
    
  end
  
    describe 'DELETE #destroy' do
      before do
        allow(controller).to receive(:session).and_return(user_id: user.id)
      end
  
      it 'logs the user out' do
        delete :destroy
        expect(session[:user_id]).to be_nil
      end
  
      it 'redirects to the root path' do
        delete :destroy
        expect(response).to redirect_to root_path
      end

      it 'clears the user_id in session' do
        expect(session[:user_id]).to be_nil
      end
    end
  end
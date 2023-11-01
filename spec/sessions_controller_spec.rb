require 'rails_helper'

# describe SessionsController, type: :controller do
    # describe 'POST #create' do
    #   context 'with valid credentials' do  
    #     it 'logs in the user and redirects to the root path' do
    #       post :create, params: { username: 'valid_user', password: 'valid_password' }
    #     #   expect(response).to redirect_to(root_path)
    #       expect(session[:user_id]).to eq(user.id)
    #       expect(flash[:notice]).to eq('Login Successful')
    #     end
    #   end
  
    #   context 'with invalid credentials' do
    #     it 'does not log in the user and renders the new template with an error message' do
    #       post :create, params: { username: 'nonexistent_user', password: '' }
    #       expect(response).to render_template(:new)
    #       expect(session[:user_id]).to be_nil
    #       expect(flash[:notice]).to eq('Incorrect Username or Password')
    #     end
    #   end
    # end
#   end
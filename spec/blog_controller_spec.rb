require 'rails_helper'

RSpec.describe BlogsController, type: :controller do
  let(:user) { create(:user) }
  let(:valid_attributes) { { title: 'Test Blog', content: 'Content', is_public: true, tags_string: 'tag1,tag2' } }
  let(:invalid_attributes) { { title: '', content: '' } }
  let!(:blog) { create(:blog, user: user) }

  describe "GET #index" do
    it "does not require user authentication" do
      expect(controller).not_to receive(:auth_user)
      get :index
    end

    it "assigns all public blogs as @blogs" do
      get :index
      expect(assigns(:blogs)).to eq([blog])
    end

    context 'when the user is logged in' do
      before { allow(controller).to receive(:logged_in?).and_return(true) }

      it 'allows accessing the index action' do
        get :index
        expect(response).to be_successful
      end
    end
  end

  describe "GET #new" do
    before { allow(controller).to receive(:auth_user) }

    it "requires user authentication" do
      expect(controller).to receive(:auth_user)
      get :new
    end

    it "assigns a new blog as @blog" do
      get :new
      expect(assigns(:blog)).to be_a_new(Blog)
    end
  end

  describe "POST #create" do
    let(:user) { create(:user) }
    let(:valid_attributes) { { title: 'Test Blog', content: 'Content', is_public: true, tags_string: 'tag1,tag2' } }
    let(:invalid_attributes) { { title: '', content: '' } }


    before do
      allow(controller).to receive(:current_user).and_return(user)
      allow(controller).to receive(:auth_user).and_return(true)
    end

    context "with valid params" do
        it "redirects to the blog list" do
          post :create, params: { blog: valid_attributes }
          expect(response).to redirect_to(blogs_path)
        end
    end
    
    context "with invalid params" do
        it "re-renders the 'new' template" do
          post :create, params: { blog: invalid_attributes }
          expect(response).to render_template("new")
        end
    end
  end


  describe "GET #show" do
    it "does not require user authentication" do
      expect(controller).not_to receive(:auth_user)
      get :show, params: { id: blog.to_param }
    end

    it "assigns the requested blog as @blog" do
      get :show, params: { id: blog.to_param }
      expect(assigns(:blog)).to eq(blog)
    end
  end

  describe "GET #edit" do
  let(:user) { create(:user) }
  let!(:blog) { create(:blog, user: user) }

  before do
    allow(controller).to receive(:current_user).and_return(user)
    allow(controller).to receive(:auth_user)
  end

  it "requires user authentication" do
    expect(controller).to receive(:auth_user)
    get :edit, params: { id: blog.to_param }
  end

  it "assigns the requested blog as @blog" do
    get :edit, params: { id: blog.to_param }
    expect(assigns(:blog)).to eq(blog)
  end
end

  describe "PUT #update" do
    let(:user) { create(:user) }
    let!(:blog) { create(:blog, user: user) }
    let(:new_attributes) { { title: 'Updated Title' } }

    before do
        allow(controller).to receive(:current_user).and_return(user)
        allow(controller).to receive(:auth_user)
    end

    context "with valid params" do
        it "updates the requested blog" do
            put :update, params: { id: blog.to_param, blog: new_attributes }
            blog.reload
            expect(blog.title).to eq('Updated Title')
        end

        it "redirects to the blog list" do
            put :update, params: { id: blog.to_param, blog: new_attributes }
            expect(response).to redirect_to(blogs_path)
        end
    end

    context "with invalid params" do
      it "re-renders the 'edit' template" do
        put :update, params: { id: blog.to_param, blog: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end
end

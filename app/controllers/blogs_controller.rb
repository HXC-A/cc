class BlogsController < ApplicationController
    before_action :auth_user, except: [:index, :show]

    def index
        @blogs = Blog.page(params[:page] || 1).per_page(params[:per_page] || 10).
        order("id desc")
    end

    def new
        @blog = Blog.new
    end

    def create
        @blog = current_user.blogs.new(params.require(:blog).permit(:title, :content))
        if @blog.save
            flash[:notice] = "Blog created successfully"
            redirect_to blogs_path
        else
            flash[:notice] = "Blog creation failed"
            render action: :new
        end
    end

    def show
        @blog = Blog.find params[:id]
    end

end

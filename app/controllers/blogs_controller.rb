class BlogsController < ApplicationController
    before_action :auth_user, except: [:index, :show]

    def index
        @blogs = Blog.page(params[:page] || 1).per_page(params[:per_page] || 10).
        order("id desc").where(is_public: true).includes(:tags, :user)
    end

    def new
        @blog = Blog.new
    end

    def create
        @blog = current_user.blogs.new(blog_attrs)
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

    def edit
        @blog = current_user.blogs.find params[:id]
        render action: :new
    end

    def update
        @blog = current_user.blogs.find params[:id]
        @blog.attributes = blog_attrs
        if @blog.save
          @blog.tags.destroy_all
          flash[:notice] = "Blog updated successfully"
          redirect_to blogs_path
        else
          flash[:notice] = "Blog update failed"
          render action: :new
        end
    end

    private
    def blog_attrs
        params.require(:blog).permit(:title, :content, :is_public, :tags_string)
    end

end

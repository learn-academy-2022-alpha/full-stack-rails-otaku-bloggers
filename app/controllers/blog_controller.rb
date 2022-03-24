class BlogController < ApplicationController
  def index
    @blogs = Blog.all
  end
  def show
    @blog = Blog.find(params[:id])
  end
  def new
    @blog = Blog.new
  end
  def create
    @blog = Blog.create(blog_params)
    if @blog.valid?
      redirect_to blogs_path
    end
  end
  def delete
    @blog = Blog.find(params[:id]).destroy
    redirect_to blogs_path
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
    if @blog.valid?
      redirect_to blogs_path(@blog)
    else
      redirect_to editpost_path
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end

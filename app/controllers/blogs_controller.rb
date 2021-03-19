class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :show, :destroy]
  def index
    @blogs = Blog.all
  end

  def show

  end

  def new
  @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blog_path(@blog)
    else
      render :edit
    end
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.house = House.find(1)
    @blog.user = current_user
    if @blog.save!
      redirect_to blog_path(@blog)
    else
      render :new
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end

  private
  def set_blog
    @blog = Blog.find(params[:id])
  end
  def blog_params
    params.require(:blog).permit(:title, :rich_body, photos: [])
  end
end

class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :show, :destroy]
  def index
    @blogs = policy_scope(Blog.all.includes([:rich_text_rich_body]).includes([:user]))
  end

  def show
    authorize @blog
  end

  def new
    @blog = Blog.new
    authorize @blog
  end

  def edit
    @blog = Blog.find(params[:id])
    authorize @blog
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blog_path(@blog)
    else
      render :edit
    end
    authorize @blog
  end

  def create
    authorize @blog
    @blog = Blog.new(blog_params)
    @blog.house = House.find(1)
    @blog.user = current_user
    if @blog.save
      redirect_to blog_path(@blog)
    else
      render :new
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
    authorize @blog
  end

  private
  def set_blog
    @blog = Blog.find(params[:id])
  end
  def blog_params
    params.require(:blog).permit(:title, :rich_body, photos: [])
  end
end

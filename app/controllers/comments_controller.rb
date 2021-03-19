class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :show, :destroy]

  def new
  @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to comment_path(@comment)
    else
      render :edit
    end
  end

  def create
    @comment = Comment.new(comment_params)
    project = Project.find(params[:project_id])
    @comment.project = project
    @comment.user = current_user
    if @comment.save
      redirect_to project_path(project)
    else
      render :new
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_path
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end
  def comment_params
    params.require(:comment).permit(:rich_body)
  end
end

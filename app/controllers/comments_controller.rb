class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create    

    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])

    @comment.save

    redirect_to @post    
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to @comment, :notice  => "Successfully updated comment."
    else
      render :action => 'edit'
    end
  end

  def destroy
    puts params.to_yaml

    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    
    redirect_to @post
  end
end

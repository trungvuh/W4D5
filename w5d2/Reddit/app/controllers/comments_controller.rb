class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @post = Post.find_by(id: params[:post_id])
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to post_url(@comment.post)
    else
      flash[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def destroy
    @comment = current_user.comments.find_by(id: params[:id])
    @comment.destroy!
    redirect_to root_url
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

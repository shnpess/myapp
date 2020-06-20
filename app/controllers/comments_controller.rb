class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.create(comment_params)

    redirect_to post_path(comment.post_id)
  end

  def destroy
    post = comment.find(params[:id])
    post.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end

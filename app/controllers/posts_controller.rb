class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:notice] = "投稿完了しました"
      redirect_to posts_path
    else
      flash.now[:alert] = "投稿に失敗しました"
      render ("posts/new")
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
    flash[:notice] = "編集完了しました"
    redirect_to posts_path
    else
      flash.now[:alert] = "編集に失敗しました"
      render ("posts/edit")
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:name, :age, :weight, :gender, :character, :image, :content).merge(user_id: current_user.id)
  
  end
end

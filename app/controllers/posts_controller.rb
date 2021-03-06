class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :category_action, only: [:index, :edit, :new, :create, :update]

  def index
    @posts = Post.includes(:user).order("created_at DESC")
    @post = Post.new
    @like = Like.new
  end

  def new
    @post = Post.new
    @like = Like.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:notice] = "投稿完了しました"
      redirect_to posts_path
    else
      flash.now[:alert] = "投稿に失敗しました"
      render("posts/new")
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order("created_at DESC")
    @group = Group.new
  end

  def edit
    @post = Post.find(params[:id])
    unless @post.user.id == current_user.id
      redirect_to posts_path
      flash[:alert] = "権限がありません"
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      flash[:notice] = "編集完了しました"
      redirect_to post_path(@post.id)
    else
      flash.now[:alert] = "編集に失敗しました"
      render("posts/edit")
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to posts_path
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  private

  def post_params
    params.require(:post).permit(:name, :age, :vaccination, :kind, :gender, :character, :image, :content, :category_ids).merge(user_id: current_user.id)
  end
end

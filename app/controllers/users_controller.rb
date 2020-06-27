class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :category_action, only: :show
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = Post.new
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to posts_path
      flash[:alert] = "権限がありません"
    end
    if current_user.nickname == "ゲスト"
      flash[:alert] = "権限がありません"
      redirect_to posts_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "編集が完了しました"
      redirect_to posts_path
    else
      flash.now[:alert] = "編集に失敗しました"
      render("users/edit")
    end
  end

  def destroy
    user = current_user
    user.destroy
    flash[:notice] = "退会しました"
    redirect_to posts_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :addres, :email, :picture, :profile)
  end
end

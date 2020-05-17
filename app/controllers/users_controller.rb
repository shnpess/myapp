class UsersController < ApplicationController

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
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
    flash[:notice] = "編集が完了しました"
    redirect_to posts_path
    else
      flash.now[:alert] = "編集に失敗しました"
      render ("users/edit")
    end
  end
  private
  def user_params
    params.require(:user).permit(:nickname, :email, :picture, :profile)
  
  end


end

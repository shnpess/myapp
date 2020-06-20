class TopController < ApplicationController
  def index
    render layout: false
  end

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com', nickname: "ゲスト") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to posts_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end

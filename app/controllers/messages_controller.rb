class MessagesController < ApplicationController
  before_action :set_group


  def index
    @message = Message.new
    @messages = @group.messages.includes(:user).order("created_at DESC")
  end

  def create
    
    @message = @group.messages.create(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to post_group_messages_path(@post.id, @group.id)  }
        format.json
      end
      
    
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:post_id])
  end

end

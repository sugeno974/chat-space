class MessagesController < ApplicationController

  def index
    @group = current_user.groups.first
    @message = Message.new
  end

  def create
    @message = Message.new(create_params)
    if @message.save
      flash[:notice] = 'メッセージ送信成功。'
    else
      flash[:alert] = 'メッセージが空です。'
    end
    redirect_to group_messages_path
  end

  private

  def create_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end

end

class MessagesController < ApplicationController

  def index
    @group = current_user.groups.first
    @message = Message.new
  end

  private

  def create_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end

end

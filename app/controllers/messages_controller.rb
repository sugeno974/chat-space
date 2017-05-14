class MessagesController < ApplicationController

  def index
    @group = current_user.groups.first
    @message = Message.new
  end

end

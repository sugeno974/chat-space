class MessagesController < ApplicationController

  def index
    @group = current_user.groups.first
  end

end

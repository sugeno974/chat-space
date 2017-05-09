class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(create_params)
    if @group.save
      flash[:notice] = 'チャットグループが作成されました。'
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update(create_params)
  end

  private

  def create_params
    params.require(:group).permit(:name, user_ids: [])
  end

end

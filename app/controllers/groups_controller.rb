class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(create_params)
    if @group.save
      flash[:notice] = 'チャットグループが作成されました。'
      redirect_to root_path
    else
      flash.now[:alert] = 'チャットグループが作成されませんでした。'
      render :new
    end
  end

  def edit
  end

  def update
    @group.update(create_params)
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def create_params
    params.require(:group).permit(:name, user_ids: [])
  end

end

class TopsController < ApplicationController
  def index
    @tops = Top.all
    @items = Top.all.order('created_at DESC')
  end

  def new
    @top = Top.new
  end

  def create
    @top = Top.new(tops_params)
    @top.save!
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def tops_params
    params.require(:top).permit(:video_top, :image, :title, :client_id).merge(client_id: current_client.id)
  end
end

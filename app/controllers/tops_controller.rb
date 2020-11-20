class TopsController < ApplicationController
  def index
    @tops = Top.all
  end

  def new
    @top = Top.new
  end

  def create
    @top = Top.new(tops_params)
    @top.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def tops_params
    params.require(:top).permit(:video_top, :image, :title, :client_id)
  end
end

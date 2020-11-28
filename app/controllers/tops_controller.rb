class TopsController < ApplicationController
  def index
    @top = Top.find_by(params[:id])
    @tops = Top.all.order('created_at DESC')
    @products = Product.all #レンダーで_product.htmlを表示させる為の定義
  end

  def new
    @top = Top.new
  end

  def create
    @top = Top.new(tops_params)
    @top.save!
  end

  def edit
    @top = Top.find_by(params[:id])

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

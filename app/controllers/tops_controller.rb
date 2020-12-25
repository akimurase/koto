class TopsController < ApplicationController
  def index
    # @top = Top.find(current_client.id)
    @top = Top.find_by(params[:id])
    @products = Product.all #top/indexでproductのデータを表示させる為。元々レンダーで_product.htmlを表示させる為の定義だった。
    @client = Client.find_by(params[:id]) #footer条件分岐のため
  end

  def new
    @top = Top.new
  end

  def show
    # @top = Top.find_by(params[:id]) 
    # @products = Product.all #プロダクト画像
    # @product = Product.find(params[:id]) #もしtop/showでプロダクトの編集をす場合は、idを特定するためfind(params[:id])が必要
    @event = Event.all
  end

  def create
    @top = Top.new(tops_params)
    if @top.save
      redirect_to new_product_path
    else
      render :new
    end
    # @tops = Top.find_by(params[:id])
  end

  def edit
    @top = Top.find(params[:id]) #データ取得（トップ動画再生と編集データ取得）
    @products = Product.all #プロダクト画像
    @client = Client.find_by(params[:id]) #footer条件分岐のため

  end

  def update
    top = Top.find(params[:id])
    top.update(tops_params)
    # if top.valid?
    redirect_to edit_top_path
    # else
    # end
  end

  def destroy
    @top = Top.find(params[:id])
    @top.destroy!
    redirect_to root_path
  end

  private

  def tops_params
    params.require(:top).permit(:video_top, :image, :title, :client_id).merge(client_id: current_client.id)
  end
end

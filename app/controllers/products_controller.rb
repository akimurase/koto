class ProductsController < ApplicationController
  # before_action :set_item, only: [:]

  def index
    @products = Product.all
    @product = Product.find(params[:product_id])
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id]) #プロダクトを特定するためfind(params[:id])が必要
    @points = Point.all #レンダーさせる為の定義
  end

  def create
    @product = Product.new(products_params)
    @product.save!
  end
  
  def edit
  end
  
  def update
    # アップデート画面を画面を挟むと編集時面倒なので後で設定。更新できたかどうかはJSのアラートで知らせる
    # redirect_to :index
  end

  def destroy
  end

  private

  def products_params
    params.require(:product).permit(:image, :name, :text, :title, :text2, :price, :unit).merge(client_id: current_client.id)
  end
end
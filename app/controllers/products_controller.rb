class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
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
    params.require(:product).permit(:image, :name, :text).merge(client_id: current_client.id)
  end
end
class ProductsController < ApplicationController
  # before_action :set_item, only: [:]

  def index
    # @products = Product.all
    @product = Product.find(params[:format]) #現在のidを取得する為params[:format]を使用
    @points = Point.where(product_id: @product)#ポイントをproducts/indexに表示させる為に定義
    @itinerarys = Itinerary.where(product_id: @product) #旅程をproducts/indexに表示させる定義
    @event = Event.new
    @client = Client.find_by(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      @client = Client.find(current_client.id) #どのクライアントか特定する為にcurrent_client.id
      @top = Top.find_by(client_id: @client.id)
      binding.pry
      redirect_to edit_top_path(@top.id)
    else
      render :new
    end
  end

  def add
    @product = Product.new(products_add_params)
    if @product.save
      @top = Top.find_by(params[:id])
      redirect_to edit_top_path(@top.id)
    else
      @top = Top.find_by(params[:id])
      redirect_to edit_top_path(@top.id)
    end

  end

  def edit
    @client = Client.find(current_client.id)
    # @top = Top.find_by(client_id: @client.id) 
    @product = Product.find(params[:id]) #表示させる際プロダクトを特定するためfind(params[:id])が必要
    @points = Point.where(product_id: @product) #確認用におすすめをproducts/indexに表示させる為の定義。現在のproduct_idを取得する為where(product_id: @product)でidを探す
    # @point = Point.find(params[:id]) #編集のさいフォームに予め現在のデータを入力させておく為には設定が必要
    @itinerarys = Itinerary.where(product_id: @product) #確認用に旅程をproducts/indexに表示させる定義。現在のproduct_idを取得する為where(product_id: @product)でidを探す
    @event = Event.new #申し込みフォーム
  end
  
  def update
    product = Product.find(params[:id]) #編集するべきレコードのid
    product.update(products_params)
    redirect_to edit_product_path(product) #どのプロダクトに帰るかidを指定
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy!
    @top = Top.find_by(params[:id])
    # @top = Top.find(params[:id])
    redirect_to edit_top_path(@top.id) #topの編集画面に遷移したい
  end

  private

  def products_params
    params.require(:product).permit(:image, :name, :text, :title, :text2, :price, :unit).merge(client_id: current_client.id)
  end

  def products_add_params
    params.permit(:image, :name, :text, :title, :text2, :price, :unit).merge(client_id: current_client.id)
  end
end
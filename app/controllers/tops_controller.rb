class TopsController < ApplicationController
  def index
    @client = Client.find(current_client.id) #footer条件分岐のため。どのクライアントか特定する為にcurrent_client.id
    @top = Top.find_by(client_id: @client.id) 
    # @products = Product.find(params[:id]) #top/indexでproductのデータを表示させる為。元々レンダーで_product.htmlを表示させる為の定義だった。
    @products = Product.where(client_id: @client.id) #top/indexでproductのデータを表示させる為。
  end

  def new
    @top = Top.new
  end

  def show
    if @top == nil
      redirect_to new_top_path
    else
      @top = Top.find(params[:id]) 
      @products =  Product.where(client_id: params[:id])
      @product = Product.find(params[:id])
      @client_id = (params[:id])
      session["current.client_id"] = {client: @client_id}
    end

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
    @client = Client.find(current_client.id) #footer条件分岐のため
    @top = Top.find_by(client_id: @client.id)#データ取得（トップ動画再生と編集データ取得）
    @products = Product.where(client_id: @client.id) #top/indexでproductのデータを表示させる為。
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

class EventsController < ApplicationController

  before_action :search_event, only: [:index, :search, :show]
  
  def index
    # @events = Event.all
    # set_event_column
    @events = Event.where(client_id: current_client.id) 
    @event_name = @events.select("product_name").distinct #Eventではなく@eventsとする事でプルダウンでログイン中のクライアントのデータのみ取得
    @client = Client.find(current_client.id) #footer条件分岐のため
    @top = Top.find_by(params[:id]) #footer条件分岐のため
  end

  def new
    @user = User.find(current_user.id)
    @event = Event.new(event_params)
    @product = Product.find(params[:product_id])
    # @client = Client.find(current_client.id) #footer条件分岐とカレントid取得のため
    @top = Top.find_by(params[:id]) #footer条件分岐のため
  end
  
  def create
    @product = Product.find(params[:product_id])
    @event = Event.new(event_create_params)
    if @event.valid?
      pay_item
      @event.save
    else
      render :new
    end
    # @client = Client.find(current_client.id)
    @top = Top.find_by(params[:id]) #footer条件分岐のため
  end

  def show
    # @e = Event.ransack(params[:q])
    @event = Event.find_by(id: params[:id])
    @results = @e.result#.includes(:event)
  end

  def edit
    @event = Event.find(params[:id])
    @client = Client.find_by(params[:id]) #footer条件分岐のため
    # @user = User.where()
    # @product = Product.all
  end
  
  def update
    event = Event.find(params[:id])
    event.update(event_edit_params)
    redirect_to edit_event_path(event.id)
  end
  
  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to events_path
  end

  def search_words
    @client = Client.find_by(params[:id]) #footer条件分岐のため
    @events = Event.search(params[:keyword])
    # @users = User.search(params[:keyword])
    # binding.pry
  end

  def search
    @client = Client.find_by(params[:id]) #footer条件分岐のため
    # @e = Event.ransack(params[:q])
    @results = @e.result#.includes(:event)
  end

  private
  

  def event_params
    @product = Product.find(params[:product_id])
    params.permit(:user_name, :user_kana, :user_email, :user_tel, :product_name, :price, :num_id, :start_time, :product_id)
          .merge(user_id: current_user.id, client_id: @product.client_id)
  end

  def event_create_params
    @product = Product.find(params[:product_id])
    params.require(:event).permit(:user_name, :user_kana, :user_email, :user_tel, :product_name, :price, :num_id, :start_time, :product_id)
          .merge(user_id: current_user.id, client_id: @product.client_id, token: params[:token])
  end

  def event_edit_params
    params.require(:event).permit(:user_name, :user_kana, :user_email, :user_tel, :product_name, :price, :num_id, :start_time, :product_id)
          .merge(user_id: current_user.id, client_id: current_client.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 環境変数に入れて呼び込む
    Payjp::Charge.create(
      amount: @event.price, 
      card: event_create_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def search_event
    @e = Event.ransack(params[:q])
  end

  def set_event_column #重複をなくす
    @event_name = Event.select("product_name").distinct
  end
end

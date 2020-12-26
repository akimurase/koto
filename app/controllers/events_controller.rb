class EventsController < ApplicationController

  before_action :search_event, only: [:index, :search, :show]
  
  def index
    # @e = Event.ransack(params[:q])
    @events = Event.all
    set_event_column
    @client = Client.find_by(params[:id]) #footer条件分岐のため
    @top = Top.find_by(params[:id]) #footer条件分岐のため

  end

  def new
    @event = Event.new(event_params)
    @user = User.find(current_user.id)
    @product = Product.find(params[:product_id])
    @client = Client.find_by(params[:id]) #footer条件分岐のため
    @top = Top.find_by(params[:id]) #footer条件分岐のため
  end
  
  def create
    @event = Event.new(event_params)
    # @event = Event.new(event_create_params)
    # @event = Event.new(event_params)
    if @event.save!
      
    else
      # render :new
      # redirect_to new_product_event_path
      # redirect_to products_path(:product_id)
    end  
    # unless @event.save!
    #   render :new
    # end
    @client = Client.find_by(params[:id]) #footer条件分岐のため
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
    params.permit(:user_name, :user_kana, :user_email, :user_tel, :product_name, :price, :num_id, :start_time, :product_id).merge(user_id: current_user.id, client_id: current_user.id)  #,:token
  end

  def event_create_params
    # params.permit(:user_name, :user_kana, :user_email, :user_tel, :product_name, :price, :num_id, :start_time, :product_id).merge(user_id: current_user.id, client_id: current_user.id)  #,:token
    params.require(:event).permit(:user_name, :user_kana, :user_email, :user_tel, :product_name, :price, :num_id, :start_time, :product_id).merge(user_id: current_user.id, client_id: current_user.id)  #,:token
  end

  def event_edit_params
    params.require(:event).permit(:user_name, :user_kana, :user_email, :user_tel, :product_name, :price, :num_id, :start_time, :product_id).merge(user_id: current_user.id, client_id: current_user.id)  #,:token
  end


  def search_event
    @e = Event.ransack(params[:q])
  end

  def set_event_column #重複をなくす
    @event_name = Event.select("start_time").distinct
  end
end

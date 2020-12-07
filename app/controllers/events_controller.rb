class EventsController < ApplicationController

  before_action :search_event, only: [:index, :search, :show]
  
  def index
    # @e = Event.ransack(params[:q])
    @events = Event.all
    set_event_column
  end

  def new
    @event = Event.new(event_params)
    @user = User.find(current_user.id)
    # @user = User.all
    @product = Product.find(params[:product_id])
    # binding.pry
  end

  def confirm
    @event = Event.new(event_params)
    # binding.pry
    # render : if @event.invalid?
  end

  def create
    event = Event.new(event_params)
    event.save!
    # if params[:back]
    #   render :new
    # else pay_event && @event.save!
      # redirect_to @event
    # end
  end

  def show
    # @e = Event.ransack(params[:q])
    @event = Event.find_by(id: params[:id])
    @results = @e.result#.includes(:event)
  end

  def edit
    @event = Event.find(params[:id])
    # @user = User.where()
    # @product = Product.all
  end
  
  def update
    event = Event.find(params[:id])
    event.update(event_params)
  end
  
  def destroy
    event = Event.find(params[:id])
    event.destroy
  end

  def search_words
    # @events = Event.search(params[:keyword])
    @users = User.search(params[:keyword])
  end

  def search
    # @e = Event.ransack(params[:q])
    @results = @e.result#.includes(:event)
  end

  private
  
  def event_params
    # params.require(:event).permit(:price, :num_id, :start_time, :product_id).merge(user_id: current_user.id, client_id: current_user.id)  #,:token
    params.permit(:user_name, :user_kana, :user_email, :user_tel, :product_name, :price, :num_id, :start_time, :product_id).merge(user_id: current_user.id, client_id: current_user.id)  #,:token
  end

  def search_event
    @e = Event.ransack(params[:q])
  end

  def set_event_column #重複をなくす
    @event_name = Event.select("start_time").distinct
  end
end

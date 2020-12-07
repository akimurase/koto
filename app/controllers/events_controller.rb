class EventsController < ApplicationController

  before_action :search_event, only: [:index, :search]
  
  def index
    @events = Event.all
    set_event_column
  end

  def new
    @event = Event.new(event_params)
    # @product = Product.find(params[:product_id])
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
    @event = Event.find_by(id: params[:id])
  end

  def edit
    @event = Event.find(params[:id])
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
    @results = @e.result#.includes(:event)
  end

  private
  
  def event_params
    # params.require(:event).permit(:price, :num_id, :start_time, :product_id).merge(user_id: current_user.id, client_id: current_user.id)  #,:token
    params.permit(:price, :num_id, :start_time, :product_id).merge(user_id: current_user.id, client_id: current_user.id)  #,:token
  end

  def search_event
    @e = Event.ransack(params[:q])
  end

  def set_event_column #重複をなくす
    @event_name = Event.select("start_time").distinct
  end
end

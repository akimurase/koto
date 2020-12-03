class EventsController < ApplicationController
  def index
    @events = Event.all
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

  private
  
  def event_params
    # params.require(:event).permit(:price, :num_id, :start_time, :product_id).merge(user_id: current_user.id, client_id: current_user.id)  #,:token
    params.permit(:price, :num_id, :start_time, :product_id).merge(user_id: current_user.id, client_id: current_user.id)  #,:token
  end
end

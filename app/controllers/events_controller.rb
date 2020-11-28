class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    # @event = Event.new
    # @product = Product.find(params[:product_id])
  end

  def confirm
    @event = Event.new(event_params)
    render :_new if @event.invalid?
  end

  def create
    @event = Event.new(event_params)
    binding.pry
    @event.save!
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
    params.require(:event).permit(:num_id, :start_time).merge(user_id: current_user.id)  #,:token
  end
end

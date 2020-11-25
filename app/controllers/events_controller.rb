class EventsController < ApplicationController
  def index
    # @events = Event.all
  end

  def new
    @event = Event.new
  end

  def confirm
    @event = Event.new(event_params)
    render :new if @event.invalid?
  end

  def create
    @event = Event.new(event_params)
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
  end

  def update
  end

  def destroy
  end

  private
  
  def event_params
    params.require(:event).permit(:num_id,)#:start_time#.merge(user_id: current_user.id)  #,:token
  end
end

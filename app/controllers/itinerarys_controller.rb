class ItinerarysController < ApplicationController
  def index
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(itinerarys_params)
    @itinerary.save!
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  # def itinerarys_params
  #   params.permit(itineary_attributes:[:image, :time, :title, :text, :product_id, :_destroy])
  # end
end

# rails g controller schedules index new create show edit update destroy 
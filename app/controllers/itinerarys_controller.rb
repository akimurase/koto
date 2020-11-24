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

  def itinerarys_params
    params.permit(:image, :time, :title, :text, :product_id)
  end
end

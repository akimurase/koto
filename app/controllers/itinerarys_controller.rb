class ItinerarysController < ApplicationController
  def index
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(itinerarys_params)
    @itinerary.save!
    binding.pry
    product_id = Product.find(params[:product_id]) #帰る先のプロダクトidをfind(params[:product_id])で取得
    redirect_to edit_product_path(product_id) #どのプロダクトに帰るかidを指定
  end

  def edit
  end

  def update
    itinerary = Itinerary.find(params[:id])
    itinerary.update(itinerarys_params)
    product_id = Product.find(params[:product_id]) #帰る先のプロダクトidをfind(params[:product_id])で取得
    redirect_to edit_product_path(product_id) #どのプロダクトに帰るかidを指定
  end

  def destroy
    itinerary = Itinerary.find(params[:id])
    itinerary.destroy
    product_id = Product.find(params[:product_id]) #帰る先のプロダクトidをfind(params[:product_id])で取得
    redirect_to edit_product_path(product_id) #どのプロダクトに帰るかidを指定
  end

  private

  def itinerarys_params
    params.permit(:time, :title, :text, :image, :product_id)
  end
end

# def itinerarys_params
#   params.permit(itineary_attributes:[:image, :time, :title, :text, :product_id, :_destroy])
# end
# rails g controller schedules index new create show edit update destroy 
class PointsController < ApplicationController
  before_action :set_product, only: [:show, :create]

  def index
  end

  def new
    # @product = Product.find(params[:product_id])
    @point = Point.new
  end

  def create
    # @product = Product.find(params[:product_id])
    @point = Point.new(points_params)
    @point.save!
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def points_params
    params.permit(:image, :title, :text, :product_id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

end

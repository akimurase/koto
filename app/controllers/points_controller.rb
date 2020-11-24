class PointsController < ApplicationController
  def index
  end

  def new
    @point = Point.new
  end

  def create
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

end

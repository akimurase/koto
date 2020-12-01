class PointsController < ApplicationController
  def index
  end

  def new
    @point = Point.new
  end

  def create
    point = Point.new(points_params)
    point.save!
    product_id = Product.find(params[:product_id]) #帰る先のプロダクトidをfind(params[:product_id])で取得
    redirect_to edit_product_path(product_id) #どのプロダクトに帰るかidを指定
  end

  def edit
    @point = Point.find(params[:id]) #point/editに遷移させなければ不要
  end
  
  def update
    point = Point.find(params[:id])
    # point.update!(update_points_params) #editページに遷移して編入する場合はこちら
    point.update(points_params) #productページで編集する場合はこちら
    product_id = Product.find(params[:product_id]) #帰る先のプロダクトidをfind(params[:product_id])で取得
    redirect_to edit_product_path(product_id) #どのプロダクトに帰るかidを指定
  end

  def destroy
    point = Point.find(params[:id])
    point.destroy
    product_id = Product.find(params[:product_id]) #帰る先のプロダクトidをfind(params[:product_id])で取得
    redirect_to edit_product_path(product_id) #どのプロダクトに帰るかidを指定
  end

  private

  def points_params
    params.permit(:title, :text, :image, :product_id)
  end
  def update_points_params
    params.require(:point).permit(:title, :text, :image, :product_id)
  end

end

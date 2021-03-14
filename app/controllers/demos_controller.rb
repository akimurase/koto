class DemosController < ApplicationController
  before_action :search_product, only: [:schedule, :search]

  def home
  end

  def about
  end

  def index
    @sample = Sample.find(current_sample.id)
  end

  def new
    @demo = Demo.new(demo_params)
  end

  def create
    @demo = Demo.new(demo_create_params)
    if @demo.valid?
      @demo.save
    else
      render :new
    end
  end

  def show
  end

  def schedule
    @demos = Demo.all
    # @demo_yaer = Demo.ransack(start_time_cont: [1]).result.to_sql
    # @demo_date = Demo.select("start_time_date").distinct
    set_demo_column
  end

  def edit
    @demo = Demo.find(params[:id])
  end

  def update
    demo = Demo.find(params[:id])
    demo.update!(demo_create_params)
    redirect_to edit_demo_path(demo.id)
  end

  def destroy
    demo = Demo.find(params[:id])
    demo.destroy
    redirect_to demos_schedule_path(demo.id)
  end

  def list
    @clients = Client.all
  end

  def search
    @results = @d.result
  end

  def search_words
  end

  private

  def demo_params
    # params.require(:demo).permit(:sample_name, :sample_kana, :sample_email, :sample_tel, :sample_product_name, :price, :num_id, :start_time, :sample_id).merge(sample_id: current_sample.id, token: params[:token])
    params.permit(:sample_name, :sample_kana, :sample_email, :sample_tel, :sample_product_name, :price, :num_id, :start_time, :sample_id).merge(
      sample_id: current_sample.id, token: params[:token]
    )
  end

  def demo_create_params
    params.require(:demo).permit(:sample_name, :sample_kana, :sample_email, :sample_tel, :sample_product_name, :price, :num_id, :start_time, :sample_id).merge(
      sample_id: current_sample.id, token: params[:token]
    )
  end

  def search_product
    @d = Demo.ransack(params[:q]) # 検索オブジェクトを生成
  end

  def set_demo_column
    @demo_name = Demo.select('sample_product_name').distinct
    # @demo_date = Demo.select("start_time_name").distinct# 重複なくnameカラムのデータを取り出す
  end
end

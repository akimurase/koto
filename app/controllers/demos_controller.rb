class DemosController < ApplicationController
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
    @demo = Demo.new(demo_params)
    if @demo.valid?
      @demo.save
    else
      render :new
    end

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def schedule
  end

  def search
  end

  def search_words
  end

  private

  def demo_params
    # params.require(:demo).permit(:sample_name, :sample_kana, :sample_email, :sample_tel, :sample_product_name, :price, :num_id, :start_time, :sample_id).merge(sample_id: current_sample.id, token: params[:token])
    params.permit(:sample_name, :sample_kana, :sample_email, :sample_tel, :sample_product_name, :price, :num_id, :start_time, :sample_id).merge(sample_id: current_sample.id, token: params[:token])
  end

end

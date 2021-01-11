class DemosController < ApplicationController
  def home
  end

  def about
  end

  def index
    @sample = Sample.find(current_sample.id)
  end

  def new
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
end

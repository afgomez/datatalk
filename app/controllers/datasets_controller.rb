class DatasetsController < ApplicationController
  
  def index
    @datasets = Dataset.page(params[:page])
  end
  
  
  def show
    @dataset = Dataset.find(params[:id])
  end
  
end

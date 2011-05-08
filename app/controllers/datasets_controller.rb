class DatasetsController < ApplicationController
  
  def index
    @datasets = Dataset.scoped
  end
  
  
  def show
    @dataset = Dataset.find(params[:id])
  end

  
end

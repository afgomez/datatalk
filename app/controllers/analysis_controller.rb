class AnalysisController < ApplicationController
  
  def index
    @analyses = Analysis.page(params[:page]).per(10)
  end
    
  def show
    @analysis = Analysis.find(params[:id])
  end

  
end

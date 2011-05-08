class HomeController < ApplicationController

  def index
    @analyses = Analysis.page(params[:page])
  end
  
  
end

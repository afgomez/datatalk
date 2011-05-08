class AnalysesController < ApplicationController
  
  before_filter :logged_in?,  :only => [:new, :create]

  def index
    @analyses = Analysis.page(params[:page]).per(10)
  end
    
  def show
    @analysis = Analysis.find(params[:id])
  end

  def new
    @analysis = Analysis.new
    @analysis.parent = Analysis.find(params[:reply])
  end
  
  def create
    @analysis = Analysis.new params[:analysis]
    @analysis.user_id = current_user.id
    if @analysis.save
      flash[:notice] = "Has creado la respuesta correctamente"
      redirect_to analysis_path(:id => @analysis)
    else
      render :action => :new
    end
  end
  
  private

  def logged_in?
    if current_user.nil?
      flash[:alert] = "No puedes crear análisis si no estás registrado"
      if params[:reply].blank?
        redirect_to new_user_session_path
      else
        redirect_to analysis_path(:id => Analysis.find(params[:reply]))
      end
    end
  end
end

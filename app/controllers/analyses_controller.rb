# -*- coding: utf-8 -*-
class AnalysesController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :validate_owner, :only => [:edit, :update]

  def index
    @analyses = Analysis.page(params[:page]).per(10)
  end

  def show
    @analysis = Analysis.find(params[:id])
  end

  def new
    @analysis = Analysis.new
    @analysis.parent = Analysis.find(params[:reply]) unless params[:reply].nil?
  end

  def create
    @analysis = Analysis.new params[:analysis]
    @analysis.user_id = current_user.id
    @visualization = Visualization.new params[:visualization]
    @analysis.visualization = @visualization
    if @analysis.save
      flash[:notice] = "Has creado el análisis correctamente"
      redirect_to analysis_path(:id => @analysis)
    else
      flash[:alert] = "No se ha podido crear el análisis"
      render :action => :new
    end
  end

  def edit
    @analysis = Analysis.find(params[:id])
  end

  def update
    @analysis = Analysis.find(params[:id])
    @analysis.update_attributes(params[:analysis])
    if @analysis.valid?
      flash[:notice] = "El análisis se ha actualizado."
      render :show
    else
      flash[:alert] = "No se ha podido actualizar el análisis"
      render :edit
    end
  end

  private

  def validate_owner
    render :text => '¿Intentando editar el análisis de otro usuario? Tsk, tsk, tsk...' unless Analysis.find(params[:id]).user.id == current_user.id
  end

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

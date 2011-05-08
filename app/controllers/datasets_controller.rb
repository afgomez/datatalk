# -*- coding: utf-8 -*-
class DatasetsController < ApplicationController

  # Validación
  before_filter :authenticate_user!, :only => [:new, :create]

  def index
    @datasets = Dataset.page(params[:page])
  end

  def show
    @dataset = Dataset.find(params[:id])
  end

  def new
    @dataset = Dataset.new
  end

  def create
    @dataset = Dataset.create(params[:dataset].merge(:user => current_user))
    if @dataset.valid?
      flash[:notice] = "Has creado un nuevo conjunto de datos. ¡Gracias!"
      render :show
    else
      flash[:alert] = "Ha habido algún problema con la creación del fichero de datos."
      render :new
    end
  end

  private 

  def logged_in?
    if current_user.nil?
      flash[:alert] = "No puedes subir ficheros de datos si no estás registrado"
      redirect_to new_user_session_path      
    end
  end
end

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
      render :show
    else
      render :new
    end
  end

end

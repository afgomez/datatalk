# -*- coding: utf-8 -*-
class Dashboard::DatasetsController < Dashboard::BaseController

  # Validación
  before_filter :authenticate_user!, :only => [:new, :create]

  def index
    @datasets = current_user.datasets.page(params[:page])
  end

end

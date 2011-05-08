# -*- coding: utf-8 -*-
class Dashboard::DatasetsController < Dashboard::BaseController


  def index
    @datasets = current_user.datasets.page(params[:page])
  end

end

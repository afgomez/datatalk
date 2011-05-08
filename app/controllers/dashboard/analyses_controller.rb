# -*- coding: utf-8 -*-
class Dashboard::AnalysesController < Dashboard::BaseController

  def index
    @analyses = current_user.analyses.page(params[:page])
  end

end

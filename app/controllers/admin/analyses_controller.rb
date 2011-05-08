module Admin
  class AnalysesController < Admin::BaseController

    crudify :analysis, :xhr_paging => true

  end
end

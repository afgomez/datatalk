module Admin
  class VisualizationsController < Admin::BaseController

    crudify :visualization,
            :title_attribute => 'legend', :xhr_paging => true

  end
end

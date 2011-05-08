module Admin
  class DatasetsController < Admin::BaseController

    crudify :dataset,
            :title_attribute => 'name', :xhr_paging => true

  end
end

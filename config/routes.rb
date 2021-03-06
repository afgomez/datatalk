Datatalk::Application.routes.draw do

  resources :analyses
  resources :datasets
  resources :analysis
  resources :visualizations

  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  match 'dashboard' => 'dashboard/datasets#index', :as => :dashboard
  scope(:path => 'dashboard', :as => 'dashboard', :module => 'dashboard') do
    resources :analyses, :only => :index 
    resources :visualizations, :only => :index 
    resources :datasets, :only => :index     
  end
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :analyses, :except => :show do
      collection do
        post :update_positions
      end
    end
    resources :visualizations, :except => :show do
      collection do
        post :update_positions
      end
    end

    resources :datasets, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
  
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

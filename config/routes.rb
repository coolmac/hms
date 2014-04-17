Emr::Application.routes.draw do

  resources :descriptions
  resources :answers
  resources :questions
  resources :categories
  resources :departments
  resources :hospitals

  # The priority is based upon order of creation:
  # first created -> highest priority.

  match 'details/update_details', to: 'details#update_details', :as => :visit_update_details
  match 'details/show_updated_details', to: 'details#show_updated_details', as: :show_updated_details
  match 'details/update_investigations', to: 'details#update_investigations', :as => :visit_update_investigations
  match 'details/show_updated_investigations', to: 'details#show_updated_investigations', as: :show_updated_investigations
  match 'details/show_all_investigations', to: 'details#show_all_investigations', :as => :show_all_investigations
  match 'details/show_all_histories', to: 'details#show_all_histories', :as => :show_all_histories
  match 'details/show_all_examinations', to: 'details#show_all_examinations', :as => :show_all_examinations
  match 'details/show_links', to: 'details#show_links', :as => :show_links
  match 'details/show_history', to: 'details#show_history', :as => :show_history
  match 'details/show', to: 'details#show', :as => :show_details


  #TODO Allow visits/new only for put method
  match 'visits/create', to: 'visits#create', as: :create_new_visit
  match 'patients/search', to: 'patients#search', as: :search_patient
  match 'patients/generic_search', to: 'patients#generic_search', as: :generic_search_patient
  resources :patients



  root to: "users#index"
  devise_for :users, :controllers => { :registrations => 'registrations'}, :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock'}



  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
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
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

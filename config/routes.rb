Emr::Application.routes.draw do

  match 'visits/update_details', to: 'visits#update_details', :as => :visit_update_details
  match 'visits/show_updated_details', to: 'visits#show_updated_details', as: :show_updated_details
  match 'visits/update_investigations', to: 'visits#update_investigations', :as => :visit_update_investigations
  match 'visits/show_updated_investigations', to: 'visits#show_updated_investigations', as: :show_updated_investigations
  match 'visits/show_all_investigations', to: 'visits#show_all_investigations', :as => :show_all_investigations
  match 'visits/show_all_histories', to: 'visits#show_all_histories', :as => :show_all_histories
  match 'visits/show_all_examinations', to: 'visits#show_all_examinations', :as => :show_all_examinations
  match 'visits/show_links', to: 'visits#show_links', :as => :show_links
  match 'visits/show_history', to: 'visits#show_history', :as => :show_history
  resources :visits
  resources :descriptions
  resources :answers
  resources :questions
  resources :categories
  resources :departments
  resources :hospitals


  #TODO Allow visits/new only for put method
  match 'patients/create_new_visit', to: 'patients#create_new_visit', as: :create_new_visit
  match 'patients/search', to: 'patients#search', as: :search_patient
  match 'patients/generic_search', to: 'patients#generic_search', as: :generic_search_patient
  resources :patients



  root to: "users#index"
  devise_for :users, :controllers => { :registrations => 'registrations'}, :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock'}


  # The priority is based upon order of creation:
  # first created -> highest priority.

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

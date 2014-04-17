Emr::Application.routes.draw do

  resources :descriptions
  resources :answers
  resources :questions
  resources :categories
  resources :departments
  resources :hospitals

  # The priority is based upon order of creation:
  # first created -> highest priority.

  match 'details/edit_details', to: 'details#edit_details', :as => :edit_details
  match 'details/update_details', to: 'details#update_details', as: :update_details
  match 'details/edit_investigations', to: 'details#edit_investigations', :as => :edit_investigations
  match 'details/update_investigations', to: 'details#update_investigations', as: :update_investigations
  match 'details/show_all_investigations', to: 'details#show_all_investigations', :as => :show_all_investigations
  match 'details/show_all_histories', to: 'details#show_all_histories', :as => :show_all_histories
  match 'details/show_all_examinations', to: 'details#show_all_examinations', :as => :show_all_examinations
  match 'details/show_links', to: 'details#show_links', :as => :show_links
  match 'details/show_history', to: 'details#show_history', :as => :show_history
  match 'details/show', to: 'details#show', :as => :show_details

  match 'details/history/main', to: 'histories#main', :as => :main_history
  match 'details/history/chief_complaint', to: 'histories#chief_complaint', :as => :chief_complaint
  match 'details/history/past-medical-surgical', to: 'histories#pms_history', :as => :pms_history
  match 'details/history/fms_history', to: 'histories#fms_history', :as => :fms_history
  match 'details/history/ps_history', to: 'histories#ps_history', :as => :ps_history
  match 'details/history/treatment', to: 'histories#treatment_history', :as => :treatment_history
  match 'details/history/other_systems', to: 'histories#other_systems_history', :as => :other_systems_history

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

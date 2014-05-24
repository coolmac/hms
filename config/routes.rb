Emr::Application.routes.draw do

  #TODO set up indices for all the tables  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  match 'details/edit_category',   to: 'details#edit_category', :as => :edit_category
  match 'details/edit_investigations', to: 'details#edit_investigations', :as => :edit_investigations
  match 'details/update_investigations', to: 'details#update_investigations', as: :update_investigations
  match 'details/show', to: 'details#show', :as => :show_details

  #TODO might create a common functionality for them
  match 'details/show_history', to: 'details#show_history', :as => :show_history
  match 'details/show_examinations', to: 'details#show_examinations', :as => :show_examinations
  match 'details/show_investigations', to: 'details#show_investigations', :as => :show_investigations

  #TODO Allow visits/new only for put method
  match 'visits/create_new_visit', to: 'visits#create_new_visit', as: :create_new_visit
  match 'patients/search', to: 'patients#search', as: :search_patient
  match 'patients/generic_search', to: 'patients#generic_search', as: :generic_search_patient


  get 'users/:id/edit' => 'users#edit', :as => :user
  put 'users/:id' => 'users#update', :as => :user

  get '/draw_chart' => 'users#draw_charts'
  match '/discharge_summary' => 'details#discharge_summary'
  match '/sub_category' => 'details#sub_category'

  #get "enquiries/index"

  resources :visits do
    resources :prescriptions
  end

  resources :follow_ups


  #TODO check out shallow option
  resources :admissions do
    resources :admit_days
  end

  resources :favourite_prescriptions do
    resources :prescription_medicines
  end

  resources :admissions
  # match 'admissions/index', to: 'admissions#index', :as => :admissions

  #TODO check this out for has_one relation
  # resources :visits do
  #   resource :admission
  # end

  resources :descriptions
  resources :answers
  resources :questions
  resources :categories
  resources :departments
  resources :hospitals
  resources :enquiries



  resources :patients



  root to: "users#index"
  # devise_for :users, :controllers => { :registrations => 'registrations'}, :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock'}
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :unlock => 'unblock'} do
   get 'settings/password' => 'devise/registrations#edit'
 end



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

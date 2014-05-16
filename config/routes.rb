Emr::Application.routes.draw do

  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  match 'details/edit_category',   to: 'details#edit_category', :as => :edit_category
  match 'details/edit_details',   to: 'details#edit_details', :as => :edit_details
  match 'details/update_details', to: 'details#update_details', as: :update_details
  match 'details/edit_investigations', to: 'details#edit_investigations', :as => :edit_investigations
  match 'details/update_investigations', to: 'details#update_investigations', as: :update_investigations
  match 'details/show_all_histories', to: 'details#show_all_histories', :as => :show_all_histories
  match 'details/show_links', to: 'details#show_links', :as => :show_links
  match 'details/show_history', to: 'details#show_history', :as => :show_history
  match 'details/show', to: 'details#show', :as => :show_details

  match 'details/history/main', to: 'histories#main', :as => :main_history
  match 'details/history/chief_complaint', to: 'histories#chief_complaint', :as => :chief_complaint, category: "chief_complaint", super_category: "history"  
  match 'details/history/past-medical-surgical', to: 'histories#pms_history', :as => :pms_history, category: "pms_history", super_category: "history"
  match 'details/history/fms_history', to: 'histories#fms_history', :as => :fms_history, category: "fms_history", super_category: "history"
  match 'details/history/ps_history', to: 'histories#ps_history', :as => :ps_history, category: "ps_history", super_category: "history"
  match 'details/history/treatment', to: 'histories#treatment_history', :as => :treatment_history, category: "treatment_history", super_category: "history"
  match 'details/history/other_systems', to: 'histories#other_systems_history', :as => :other_systems_history, category: "other_systems_history", super_category: "history"

  match 'details/show_examinations', to: 'details#show_examinations', :as => :show_examinations
  match 'details/examinations/main', to: 'examinations#main', :as => :main_examinations
  match 'details/examinations/gpe', to: 'examinations#gpe', :as => :gpe_examinations, category: "gpe", super_category: "examination"
  match 'details/examinations/vitals', to: 'examinations#vitals', :as => :vitals_examinations, category: "vitals", super_category: "examination"

  match 'details/show_investigations', to: 'details#show_investigations', :as => :show_investigations
  match 'details/investigations/main', to: 'investigations#main', :as => :main_investigations
  match 'details/investigations/hemogram', to: 'investigations#hemogram', :as => :hemogram_investigations, category: "hemogram"
  match 'details/investigations/glucose', to: 'investigations#glucose', :as => :glucose_investigations, category: "glucose"
  match 'details/investigations/lft', to: 'investigations#lft', :as => :lft_investigations, category: "lft"
  match 'details/investigations/rft', to: 'investigations#rft', :as => :rft_investigations, category: "rft"
  match 'details/investigations/lipid_profile', to: 'investigations#lipid_profile', :as => :lipid_profile_investigations, category: "lipid_profile"

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

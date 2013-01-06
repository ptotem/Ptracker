Golpher::Application.routes.draw do
  get "assignment/index"
  get "welcome/index"

  devise_for :users
  resources :users do
    resources :tasks
  end
  resources :projects do
    resources :tasks
  end
  resources :tasks

  match "/assignments", :to => "assignment#index", :as => "assignments"
  match "/assign/:user_id/:task_id", :to => "assignment#assign", :as => "assign_task"

  match "/projects/:id/page_list", :to => "projects#page_list", :as => "page_list"
  match "/projects/:id/feature_list", :to => "projects#feature_list", :as => "feature_list"
  match "/projects/:id/competence", :to => "projects#competence", :as => "competence"

  match "/split_task/:id/:count", :to => "tasks#split_task", :as => "split_task"
  match "/combine_tasks", :to => "tasks#combine_tasks", :as => "combine_tasks"
  match "/delete_tasks", :to => "tasks#delete_tasks", :as => "delete_tasks"
  match "tasks/:id/mark_complete", :to => "tasks#mark_complete", :as => "mark_task_complete"
  match "tasks/:id/reactivate", :to => "tasks#reactivate", :as => "reactivate_task"
  match "tasks/:id/cancel_assignment", :to => "tasks#cancel_assignment", :as => "cancel_task_assignment"
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):


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
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

BenHarrisCreative::Application.routes.draw do

  resources :contact, :only => [:index, :create], :controller => 'contact'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  resources :sessions, :only => :create

  root :to => 'home#index'
  match 'blog' => 'home#blog'
  match 'video' => 'home#video'
  match 'clients' => 'home#clients'

  namespace :admin do
    resources :users, :only => [:edit, :update]
    resources :blogs
    resources :videos
    root :to => 'admin#index'
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
end

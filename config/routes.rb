BenHarrisCreative::Application.routes.draw do

  resources :contact, :only => [:index, :create], :controller => 'contact'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  resources :sessions, :only => :create
  resources :videos, :only => :index

  root :to => 'home#index'
  match 'blog' => 'blogs#index'
  match 'clients' => 'home#clients'

  resources :blogs, :only => :show, :as => 'blog_show'

  namespace :admin do
    resource :users, :only => [:edit, :update]
    resources :blogs
    resources :videos do
      get :refresh, :on => :member
      get :update_videos, :on => :collection
      put :update_all, :on => :collection
    end
    root :to => 'admin#index'
  end

  resources :videos, :path => '/', :only => :show
end

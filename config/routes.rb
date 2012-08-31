BenHarrisCreative::Application.routes.draw do

  resources :contact, :only => [:index, :create], :controller => 'contact'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  resources :sessions, :only => :create

  root :to => 'home#index'
  match 'blog' => 'blogs#index'
  match 'video' => 'home#video'
  match 'clients' => 'home#clients'

  resources :blogs, :only => :show, :as => 'blog_show'

  namespace :admin do
    resource :users, :only => [:edit, :update]
    resources :blogs
    resources :videos
    root :to => 'admin#index'
  end
end

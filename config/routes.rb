Rails.application.routes.draw do

  root to: 'products#index'

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]
  
  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  resources :orders, only: [:create, :show]
  
  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, only: [:index, :new, :create]
    resources :sales, except: [:edit, :update, :show]
  end

  resource :users, path: '/', only: [] do
    get :new, path: 'signup'
    post :create, path: 'users'
  end

  resource :sessions, path: '/', only: [] do
    get :new, path: 'login'
    post :create, path: 'login'
    get :destroy, path: 'logout'
  end

  resource :about, only: [:show] do 
    root 'about#show'
  end

end

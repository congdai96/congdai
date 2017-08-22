Rails.application.routes.draw do
  get 'admin/index'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :users
  resources :orders
  resources :line_items
  resources :carts
  root 'store#index', as: 'store_index'

    resources :products do
     get :who_bought, on: :member
    end
  
      get 'admin' => 'admin#index'
  
    controller :sessions do
        get 'login' => :new
        post 'login' => :create
        delete 'logout' => :destroy
    end  

    scope '(:locale)' do
        resources :users
        resources :orders
        resources :line_items
        resources :carts
        
        
        root :to => 'store#index', :as => 'store'
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
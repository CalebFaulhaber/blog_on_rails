Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#home', as: 'home' 
  
  # - create 
  #   - new // refers method in controller
  #     - renders // get request
  #   - create // method
  #     - redirect // post request
  # - read
  #   - index // method
  #     - render // get request
  #   - show // method
  #     - render // get request
  # - update
  #   - edit // method
  #     - render // get request
  #   - update // method
  #     - redirect // patch request
  # - delete
  #   - destroy(maybe delete) // method
  #     - redirect // delete request

  resources :posts do
    resources :comments, only:[ :create, :destroy, :edit, :update ]
  end
  # # PATHS
  # index  - products_path
  # new    - new_product_path
  # edit   - edit_product_path
  # show   - product_path
  # create - n/a
  # update - n/a
  # destroy - n/a

  resources :users, only:[:new, :create]
  get '/user/edit', to: 'users#edit', as: 'edit_user'
  patch '/user', to: 'users#update', as: 'update_user'
  get '/user/password', to: 'users#password_edit', as: 'edit_password'
  patch '/user/password', to: 'users#password_update', as: 'update_password'

  # resources :sessions, only:[:new, :create, :destroy]
  get '/session', to: 'sessions#new', as: 'new_session'
  post '/session', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy'
  # Only changed from resources due to wording of homework assignment 
  # requestiong url to be '/session' instead of '/sessions'.

end

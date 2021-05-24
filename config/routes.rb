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
    resources :comments, only:[ :create, :destroy ]
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
  # resources :sessions, only:[:new, :create]

  get '/session', to: 'sessions#new', as: 'new_session'
  post '/session', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy'

end

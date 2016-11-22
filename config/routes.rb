Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :events, only: [:index, :show, :create, :update, :destroy]

  resources :users, only: [:create, :index, :show, :update, :destroy] do

    resources :rsvps, only: [:create, :index, :show, :update, :destroy]

    # resources :events, only: [:index, :show, :create, :update, :destroy]

    # resources :events, only: [:index, :show] do
    # end

    collection do
      post '/login', to: 'users#login'
      get '/current-user', to: 'user#current'
    end
  end
end

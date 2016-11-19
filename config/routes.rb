Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:create, :index, :show, :update, :destroy] do

    # resources :interests, only: [:create, :index, :show, :update, :destroy]
    # resources :venues, only: [:index, :show] #This might comeback
    resources :venues, only: [:index, :show]
    resources :events, only: [:create, :index, :show, :destroy] do
    end

    collection do
      post '/login', to: 'users#login'
    end
  end

end

# Prefix Verb   URI Pattern                          Controller#Action
# user_events GET    /users/:user_id/events(.:format)     events#index
#        POST   /users/:user_id/events(.:format)     events#create
# user_event GET    /users/:user_id/events/:id(.:format) events#show
#        DELETE /users/:user_id/events/:id(.:format) events#destroy
# login_users POST   /users/login(.:format)               users#login
#  users GET    /users(.:format)                     users#index
#        POST   /users(.:format)                     users#create
#   user GET    /users/:id(.:format)                 users#show
#        PATCH  /users/:id(.:format)                 users#update
#        PUT    /users/:id(.:format)                 users#update
#        DELETE /users/:id(.:format)                 users#destroy

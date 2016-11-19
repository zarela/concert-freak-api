Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :venues, only: [:index, :show]
  resources :events, only: [:index, :show]

  resources :users, only: [:create, :index, :show, :update, :destroy] do

    resources :interests, only: [:create, :index, :show, :update, :destroy]
    # resources :venues, only: [:index, :show]
    # resources :events, only: [:index, :show] do
    # end

    collection do
      post '/login', to: 'users#login'
    end
  end

end

# Prefix Verb   URI Pattern                             Controller#Action
# user_interests GET    /users/:user_id/interests(.:format)     interests#index
#        POST   /users/:user_id/interests(.:format)     interests#create
# user_interest GET    /users/:user_id/interests/:id(.:format) interests#show
#        PATCH  /users/:user_id/interests/:id(.:format) interests#update
#        PUT    /users/:user_id/interests/:id(.:format) interests#update
#        DELETE /users/:user_id/interests/:id(.:format) interests#destroy
# user_venues GET    /users/:user_id/venues(.:format)        venues#index
# user_venue GET    /users/:user_id/venues/:id(.:format)    venues#show
# user_events GET    /users/:user_id/events(.:format)        events#index
# user_event GET    /users/:user_id/events/:id(.:format)    events#show
# login_users POST   /users/login(.:format)                  users#login
#  users GET    /users(.:format)                        users#index
#        POST   /users(.:format)                        users#create
#   user GET    /users/:id(.:format)                    users#show
#        PATCH  /users/:id(.:format)                    users#update
#        PUT    /users/:id(.:format)                    users#update
#        DELETE /users/:id(.:format)                    users#destroy

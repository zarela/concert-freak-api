Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:create, :index, :show, :update, :destroy] do

    resources :interests, only: [:create, :index, :show, :update, :destroy]
    resources :events, only: [:create, :index, :show, :destroy]

    # resources :venues, only: [:index, :show] #This might comeback

    # get '/get_all', to: 'interests#get_all'
    # get 'events/index'

    collection do
      post '/login', to: 'users#login'
      # get '/allevents', 'http://api.bandsintown.com/artists/Skrillex/events.json?api_version=2.0&app_id=' + process.ENV.appId
    end
  end




end

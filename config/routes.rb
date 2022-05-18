Rails.application.routes.draw do

  get '/parks', to: 'parks#index'
  get '/parks/:park_id/hikes', to: 'park_hikes#index'
  get '/parks/:park_id/hikes/new', to: 'park_hikes#new'
  post '/parks/:park_id/hikes', to: 'park_hikes#create'
  get '/parks/:park_id/hikes/sort', to: 'park_hikes#sort'

  get '/parks/new', to: 'parks#new'
  post '/parks', to: 'parks#create'
  get '/parks/:id', to: 'parks#show'
  get '/parks/:id/edit', to: 'parks#edit'
  patch '/parks/:id', to: 'parks#update'
  delete '/parks/:id', to: 'parks#destroy'

  get '/hikes', to: 'hikes#index'
  get '/hikes/:id', to: 'hikes#show'
  get '/hikes/:id/edit', to: 'hikes#edit'
  patch '/hikes/:id', to: 'hikes#update'
  delete '/hikes/:id', to: 'hikes#destroy'
end

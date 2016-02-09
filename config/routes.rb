Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # notes
  get '/notes' => 'notes#index'
  get '/notes/new' => 'notes#new', as: :new_note
  post '/notes' => 'notes#create'
  get '/notes/:id/edit' => 'notes#edit', as: :edit_note
  get '/notes/:id' => 'notes#show', as: :note
  patch '/notes/:id' => 'notes#update'
  put '/notes/:id' => 'notes#update'
  delete  '/notes/:id' => 'notes#destroy', as: :delete_note
  
  # users
  get 'users/' => 'users#index'
  get 'users/:username' => 'users#show', as: :user
  
  # AOutH
  get '/auth/:provider/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end

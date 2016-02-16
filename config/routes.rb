Rails.application.routes.draw do
  root to: "notes#index"
  resources :users
  resources :notes

  namespace :admin do
    resources :users
    resources :notes
  end

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end

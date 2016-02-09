Rails.application.routes.draw do
  root to: "notes#index"
  resources :users
  resources :notes

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end

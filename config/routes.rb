Rails.application.routes.draw do

  devise_for :users, :controllers => { omniauth_callbacks: 'callbacks' }
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/unauthorized', :as => :unauthorized_redirect_path
  get 'static_pages/login_required', :as => :login_required_path
  get 'static_pages/help'
  get 'static_pages/signin'
  get 'grid/show'
  get 'grid/point/:id', to: 'grid#point'
  get 'grid/move/:map_point_id', to: 'grid#move', as: 'grid_move'
  
  resources :map_points
  resources :entities
  resources :players
  resources :users
  resources :terrains

end

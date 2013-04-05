Flawed::Application.routes.draw do
  get "pages/home"
  root to: 'users#show'

  get 'auth/:provider/callback', to: 'sessions#fb_create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions, only: [:create, :destroy]

  resources :users, only: [:new, :create, :show, :edit, :update]
end

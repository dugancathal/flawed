Flawed::Application.routes.draw do
  get "pages/home"
  root to: 'users#show'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'logout'

  resources :users, only: [:show, :update]
end
